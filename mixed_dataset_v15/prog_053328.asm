; DESCRIPTION: Places a yellow dot at position (425, 95).
; PLAN: r0=425(x), r1=95(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 425
LDI r1, 95
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
