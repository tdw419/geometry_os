; DESCRIPTION: Places a green circle of radius 10 at center (96, 113).
; PLAN: r0=96(x), r1=113(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 113
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
