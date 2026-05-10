; DESCRIPTION: Places a green disk with center (209, 180) and radius 21.
; PLAN: r0=209(x), r1=180(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 180
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
