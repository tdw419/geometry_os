; DESCRIPTION: Places a yellow dot at position (39, 180).
; PLAN: r0=39(x), r1=180(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 180
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
