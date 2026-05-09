; DESCRIPTION: Places a green dot at position (235, 198).
; PLAN: r0=235(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
