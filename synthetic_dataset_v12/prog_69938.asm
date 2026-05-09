; DESCRIPTION: Places a green circle of radius 50 at center (389, 192).
; PLAN: r0=389(x), r1=192(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 192
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
