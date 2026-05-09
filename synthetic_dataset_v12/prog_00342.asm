; DESCRIPTION: Sets a single green pixel at (267, 125).
; PLAN: r0=267(x), r1=125(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 267
LDI r1, 125
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
