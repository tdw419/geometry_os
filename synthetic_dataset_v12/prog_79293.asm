; DESCRIPTION: Draws a red circle centered at (313, 127) with radius 71.
; PLAN: r0=313(x), r1=127(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 127
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
