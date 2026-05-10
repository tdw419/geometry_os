; DESCRIPTION: Places a cyan dot at position (85, 113).
; PLAN: r0=85(x), r1=113(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 113
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
