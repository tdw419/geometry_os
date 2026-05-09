; DESCRIPTION: Places a blue dot at position (127, 113).
; PLAN: r0=127(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
