; DESCRIPTION: Renders a blue box of size 86x30 starting at (124, 193).
; PLAN: r0=124(x), r1=193(y), r2=86(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 193
LDI r2, 86
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
