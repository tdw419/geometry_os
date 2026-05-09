; DESCRIPTION: Places a red dot at position (445, 42).
; PLAN: r0=445(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 42
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
