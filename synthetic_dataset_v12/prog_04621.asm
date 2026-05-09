; DESCRIPTION: Renders a blue box of size 47x48 starting at (402, 202).
; PLAN: r0=402(x), r1=202(y), r2=47(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 202
LDI r2, 47
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
