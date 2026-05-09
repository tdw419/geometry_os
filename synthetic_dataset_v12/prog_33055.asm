; DESCRIPTION: Places a white dot at position (128, 111).
; PLAN: r0=128(x), r1=111(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 111
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
