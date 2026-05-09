; DESCRIPTION: Places a yellow dot at position (239, 68).
; PLAN: r0=239(x), r1=68(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 68
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
