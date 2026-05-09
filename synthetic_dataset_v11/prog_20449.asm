; DESCRIPTION: Renders a blue box of size 27x114 starting at (176, 93).
; PLAN: r0=176(x), r1=93(y), r2=27(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 93
LDI r2, 27
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
