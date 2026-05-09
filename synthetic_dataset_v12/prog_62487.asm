; DESCRIPTION: Places a green circle of radius 49 at center (206, 180).
; PLAN: r0=206(x), r1=180(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 180
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
