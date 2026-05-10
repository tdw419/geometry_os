; DESCRIPTION: Draws a red circle centered at (213, 194) with radius 46.
; PLAN: r0=213(x), r1=194(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 194
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
