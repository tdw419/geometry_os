; DESCRIPTION: Places a cyan dot at position (320, 65).
; PLAN: r0=320(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 320
LDI r1, 65
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
