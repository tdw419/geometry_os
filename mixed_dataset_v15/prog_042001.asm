; DESCRIPTION: Places a green dot at position (479, 0).
; PLAN: r0=479(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 479
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
