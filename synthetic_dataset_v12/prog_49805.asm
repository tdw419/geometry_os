; DESCRIPTION: Renders a green box of size 77x101 starting at (196, 150).
; PLAN: r0=196(x), r1=150(y), r2=77(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 150
LDI r2, 77
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
