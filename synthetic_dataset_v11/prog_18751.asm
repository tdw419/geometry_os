; DESCRIPTION: Places a magenta dot at position (146, 14).
; PLAN: r0=146(x), r1=14(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 14
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
