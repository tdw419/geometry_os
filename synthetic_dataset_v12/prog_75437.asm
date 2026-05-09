; DESCRIPTION: Places a red circle of radius 65 at center (79, 66).
; PLAN: r0=79(x), r1=66(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 66
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
