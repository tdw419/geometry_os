; DESCRIPTION: Creates a magenta circular shape at (187, 178) with radius 13.
; PLAN: r0=187(x), r1=178(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 178
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
