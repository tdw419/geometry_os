; DESCRIPTION: Places a green circle of radius 75 at center (146, 138).
; PLAN: r0=146(x), r1=138(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 138
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
