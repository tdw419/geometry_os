; DESCRIPTION: Places a magenta circle of radius 27 at center (190, 143).
; PLAN: r0=190(x), r1=143(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 143
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
