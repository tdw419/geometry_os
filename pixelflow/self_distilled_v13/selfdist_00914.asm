; DESCRIPTION: Places a green dot at position (308, 190).
; PLAN: r0=308(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
