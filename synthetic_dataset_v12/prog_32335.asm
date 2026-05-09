; DESCRIPTION: Places a green dot at position (267, 246).
; PLAN: r0=267(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 267
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
