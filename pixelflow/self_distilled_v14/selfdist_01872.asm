; DESCRIPTION: Places a green dot at position (242, 60).
; PLAN: r0=242(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 60
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
