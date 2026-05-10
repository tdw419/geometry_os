; DESCRIPTION: Places a red dot at position (479, 36).
; PLAN: r0=479(x), r1=36(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 479
LDI r1, 36
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
