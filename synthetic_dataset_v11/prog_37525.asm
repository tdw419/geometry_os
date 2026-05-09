; DESCRIPTION: Places a green circle of radius 34 at center (150, 146).
; PLAN: r0=150(x), r1=146(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 146
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
