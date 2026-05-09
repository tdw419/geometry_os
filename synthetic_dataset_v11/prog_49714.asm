; DESCRIPTION: Places a magenta circle of radius 57 at center (146, 141).
; PLAN: r0=146(x), r1=141(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 141
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
