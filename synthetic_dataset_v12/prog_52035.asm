; DESCRIPTION: Places a magenta dot at position (302, 212).
; PLAN: r0=302(x), r1=212(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 212
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
