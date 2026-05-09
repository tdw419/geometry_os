; DESCRIPTION: Renders a yellow box of size 69x117 starting at (39, 48).
; PLAN: r0=39(x), r1=48(y), r2=69(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 48
LDI r2, 69
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
