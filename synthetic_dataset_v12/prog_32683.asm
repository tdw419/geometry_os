; DESCRIPTION: Sets a single white pixel at (480, 159).
; PLAN: r0=480(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 480
LDI r1, 159
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
