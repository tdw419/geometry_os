; DESCRIPTION: Places a magenta disk with center (91, 146) and radius 60.
; PLAN: r0=91(x), r1=146(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 146
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
