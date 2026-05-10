; DESCRIPTION: Places a magenta disk with center (264, 186) and radius 64.
; PLAN: r0=264(x), r1=186(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 186
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
