; DESCRIPTION: Renders a yellow box of size 81x48 starting at (12, 207).
; PLAN: r0=12(x), r1=207(y), r2=81(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 207
LDI r2, 81
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
