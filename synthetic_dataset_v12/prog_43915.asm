; DESCRIPTION: Places a magenta circle of radius 65 at center (362, 164).
; PLAN: r0=362(x), r1=164(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 164
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
