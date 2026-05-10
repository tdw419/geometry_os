; DESCRIPTION: Places a green dot at position (21, 50).
; PLAN: r0=21(x), r1=50(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 50
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
