; DESCRIPTION: Places a red circle of radius 29 at center (127, 132).
; PLAN: r0=127(x), r1=132(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 132
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
