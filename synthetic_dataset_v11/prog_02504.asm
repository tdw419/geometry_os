; DESCRIPTION: Renders a yellow box of size 86x60 starting at (118, 196).
; PLAN: r0=118(x), r1=196(y), r2=86(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 196
LDI r2, 86
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
