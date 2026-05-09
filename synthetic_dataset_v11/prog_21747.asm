; DESCRIPTION: Renders a black box of size 20x110 starting at (64, 146).
; PLAN: r0=64(x), r1=146(y), r2=20(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 146
LDI r2, 20
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
