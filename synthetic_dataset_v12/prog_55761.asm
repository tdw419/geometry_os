; DESCRIPTION: Places a magenta circle of radius 16 at center (374, 152).
; PLAN: r0=374(x), r1=152(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 152
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
