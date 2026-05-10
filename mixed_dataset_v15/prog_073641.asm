; DESCRIPTION: Places a magenta disk with center (272, 143) and radius 40.
; PLAN: r0=272(x), r1=143(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 143
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
