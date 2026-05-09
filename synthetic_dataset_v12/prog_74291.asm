; DESCRIPTION: Renders a blue box of size 86x61 starting at (285, 20).
; PLAN: r0=285(x), r1=20(y), r2=86(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 20
LDI r2, 86
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
