; DESCRIPTION: Places a green disk with center (328, 177) and radius 24.
; PLAN: r0=328(x), r1=177(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 177
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
