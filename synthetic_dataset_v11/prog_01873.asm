; DESCRIPTION: Creates a cyan rectangular region at (7, 35) spanning 87 by 95 pixels.
; PLAN: r0=7(x), r1=35(y), r2=87(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 35
LDI r2, 87
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
