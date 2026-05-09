; DESCRIPTION: Places a white dot at position (296, 83).
; PLAN: r0=296(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
