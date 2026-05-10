; DESCRIPTION: Renders a cyan box of size 109x110 starting at (52, 1).
; PLAN: r0=52(x), r1=1(y), r2=109(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 1
LDI r2, 109
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
