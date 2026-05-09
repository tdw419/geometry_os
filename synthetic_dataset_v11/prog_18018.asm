; DESCRIPTION: Renders a cyan box of size 19x110 starting at (6, 137).
; PLAN: r0=6(x), r1=137(y), r2=19(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 137
LDI r2, 19
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
