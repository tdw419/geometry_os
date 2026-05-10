; DESCRIPTION: Places a cyan dot at position (506, 111).
; PLAN: r0=506(x), r1=111(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 506
LDI r1, 111
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
