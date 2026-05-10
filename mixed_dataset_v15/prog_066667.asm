; DESCRIPTION: Places a yellow dot at position (499, 42).
; PLAN: r0=499(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
