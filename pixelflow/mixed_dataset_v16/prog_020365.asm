; DESCRIPTION: Sets a single white pixel at (479, 24).
; PLAN: r0=479(x), r1=24(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 479
LDI r1, 24
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
