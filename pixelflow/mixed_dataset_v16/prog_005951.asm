; DESCRIPTION: Renders a blue box of size 86x52 starting at (202, 144).
; PLAN: r0=202(x), r1=144(y), r2=86(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 144
LDI r2, 86
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
