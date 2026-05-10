; DESCRIPTION: Renders a cyan rectangular region spanning 110 by 119 at (22, 30).
; PLAN: r0=22(x), r1=30(y), r2=110(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 30
LDI r2, 110
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
