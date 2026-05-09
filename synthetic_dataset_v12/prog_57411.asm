; DESCRIPTION: Creates a magenta circular shape at (187, 164) with radius 39.
; PLAN: r0=187(x), r1=164(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 164
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
