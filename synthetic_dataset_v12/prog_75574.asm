; DESCRIPTION: Places a white dot at position (403, 38).
; PLAN: r0=403(x), r1=38(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 38
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
