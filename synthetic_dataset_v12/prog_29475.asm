; DESCRIPTION: Places a red dot at position (400, 120).
; PLAN: r0=400(x), r1=120(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 120
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
