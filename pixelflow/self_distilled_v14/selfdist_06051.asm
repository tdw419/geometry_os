; DESCRIPTION: Places a yellow disk with center (70, 93) and radius 50.
; PLAN: r0=70(x), r1=93(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 93
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
