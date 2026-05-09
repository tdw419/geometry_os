; DESCRIPTION: Renders a red disk with center (193, 117) and radius 54.
; PLAN: r0=193(x), r1=117(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 117
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
