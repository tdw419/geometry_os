; DESCRIPTION: Creates a magenta circular shape at (135, 146) with radius 69.
; PLAN: r0=135(x), r1=146(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 146
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
