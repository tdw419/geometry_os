; DESCRIPTION: Places a magenta disk with center (231, 16) and radius 36.
; PLAN: r0=231(x), r1=16(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 16
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
