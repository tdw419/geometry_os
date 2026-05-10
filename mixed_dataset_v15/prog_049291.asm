; DESCRIPTION: Renders a blue rectangular region spanning 36 by 24 at (61, 150).
; PLAN: r0=61(x), r1=150(y), r2=36(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 150
LDI r2, 36
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
