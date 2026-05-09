; DESCRIPTION: Renders a yellow box of size 73x105 starting at (180, 69).
; PLAN: r0=180(x), r1=69(y), r2=73(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 69
LDI r2, 73
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
