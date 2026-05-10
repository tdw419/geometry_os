; DESCRIPTION: Places a green disk with center (276, 39) and radius 57.
; PLAN: r0=276(x), r1=39(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 39
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
