; DESCRIPTION: Creates a magenta circular shape at (307, 146) with radius 46.
; PLAN: r0=307(x), r1=146(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 146
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
