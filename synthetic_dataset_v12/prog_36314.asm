; DESCRIPTION: Places a green dot at position (435, 146).
; PLAN: r0=435(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 435
LDI r1, 146
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
