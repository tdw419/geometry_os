; DESCRIPTION: Creates a magenta circular shape at (174, 141) with radius 25.
; PLAN: r0=174(x), r1=141(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 141
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
