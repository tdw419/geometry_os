; DESCRIPTION: Places a green dot at position (216, 42).
; PLAN: r0=216(x), r1=42(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 42
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
