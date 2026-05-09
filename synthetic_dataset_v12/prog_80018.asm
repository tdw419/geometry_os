; DESCRIPTION: Places a white dot at position (284, 206).
; PLAN: r0=284(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
