; DESCRIPTION: Renders a blue box of size 15x48 starting at (237, 86).
; PLAN: r0=237(x), r1=86(y), r2=15(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 86
LDI r2, 15
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
