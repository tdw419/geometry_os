; DESCRIPTION: Places a green dot at position (202, 166).
; PLAN: r0=202(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
