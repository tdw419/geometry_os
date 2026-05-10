; DESCRIPTION: Places a yellow dot at position (180, 29).
; PLAN: r0=180(x), r1=29(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 29
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
