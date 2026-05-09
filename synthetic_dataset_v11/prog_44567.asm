; DESCRIPTION: Renders a blue box of size 63x20 starting at (146, 144).
; PLAN: r0=146(x), r1=144(y), r2=63(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 144
LDI r2, 63
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
