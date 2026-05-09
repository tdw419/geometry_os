; DESCRIPTION: Creates a cyan rectangular region at (432, 8) spanning 18 by 27 pixels.
; PLAN: r0=432(x), r1=8(y), r2=18(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 8
LDI r2, 18
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
