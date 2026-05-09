; DESCRIPTION: Places a green circle of radius 32 at center (141, 213).
; PLAN: r0=141(x), r1=213(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 213
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
