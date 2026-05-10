; DESCRIPTION: Places a magenta circle of radius 45 at center (434, 174).
; PLAN: r0=434(x), r1=174(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 174
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
