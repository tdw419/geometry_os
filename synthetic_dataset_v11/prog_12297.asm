; DESCRIPTION: Places a yellow dot at position (242, 163).
; PLAN: r0=242(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
