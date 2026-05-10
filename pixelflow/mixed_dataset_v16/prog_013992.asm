; DESCRIPTION: Draws a green circle centered at (213, 74) with radius 68.
; PLAN: r0=213(x), r1=74(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 74
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
