; DESCRIPTION: Places a green dot at position (416, 221).
; PLAN: r0=416(x), r1=221(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 221
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
