; DESCRIPTION: Places a red dot at position (284, 28).
; PLAN: r0=284(x), r1=28(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 28
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
