; DESCRIPTION: Places a yellow dot at position (269, 111).
; PLAN: r0=269(x), r1=111(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 111
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
