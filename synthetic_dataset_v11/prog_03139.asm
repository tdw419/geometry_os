; DESCRIPTION: Renders a blue box of size 103x54 starting at (147, 120).
; PLAN: r0=147(x), r1=120(y), r2=103(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 120
LDI r2, 103
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
