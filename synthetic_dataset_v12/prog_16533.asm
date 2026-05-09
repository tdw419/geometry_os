; DESCRIPTION: Creates a cyan rectangular region at (432, 120) spanning 26 by 109 pixels.
; PLAN: r0=432(x), r1=120(y), r2=26(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 120
LDI r2, 26
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
