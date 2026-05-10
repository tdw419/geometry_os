; DESCRIPTION: Draws a blue circle centered at (186, 146) with radius 57.
; PLAN: r0=186(x), r1=146(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 146
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
