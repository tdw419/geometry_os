; DESCRIPTION: Renders a blue box of size 94x30 starting at (116, 226).
; PLAN: r0=116(x), r1=226(y), r2=94(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 226
LDI r2, 94
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
