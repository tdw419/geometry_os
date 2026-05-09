; DESCRIPTION: Places a green circle of radius 46 at center (50, 70).
; PLAN: r0=50(x), r1=70(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 70
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
