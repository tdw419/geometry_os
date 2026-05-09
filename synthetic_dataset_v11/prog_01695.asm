; DESCRIPTION: Places a green circle of radius 14 at center (213, 133).
; PLAN: r0=213(x), r1=133(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 133
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
