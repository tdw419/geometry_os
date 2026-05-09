; DESCRIPTION: Renders a yellow box of size 55x66 starting at (269, 74).
; PLAN: r0=269(x), r1=74(y), r2=55(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 74
LDI r2, 55
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
