; DESCRIPTION: Renders a yellow box of size 47x96 starting at (145, 113).
; PLAN: r0=145(x), r1=113(y), r2=47(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 113
LDI r2, 47
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
