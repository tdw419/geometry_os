; DESCRIPTION: Places a green disk with center (151, 129) and radius 47.
; PLAN: r0=151(x), r1=129(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 129
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
