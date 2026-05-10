; DESCRIPTION: Places a yellow disk with center (307, 28) and radius 70.
; PLAN: r0=307(x), r1=28(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 28
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
