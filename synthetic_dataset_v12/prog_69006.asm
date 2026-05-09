; DESCRIPTION: Draws a blue circle centered at (215, 146) with radius 59.
; PLAN: r0=215(x), r1=146(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 146
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
