; DESCRIPTION: Renders a blue box of size 96x44 starting at (58, 21).
; PLAN: r0=58(x), r1=21(y), r2=96(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 21
LDI r2, 96
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
