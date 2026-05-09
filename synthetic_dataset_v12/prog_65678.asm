; DESCRIPTION: Places a green dot at position (305, 95).
; PLAN: r0=305(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
