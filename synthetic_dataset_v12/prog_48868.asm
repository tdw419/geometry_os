; DESCRIPTION: Places a cyan dot at position (54, 42).
; PLAN: r0=54(x), r1=42(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 42
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
