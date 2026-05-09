; DESCRIPTION: Creates a magenta circular shape at (394, 125) with radius 68.
; PLAN: r0=394(x), r1=125(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 125
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
