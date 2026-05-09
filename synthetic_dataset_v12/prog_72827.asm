; DESCRIPTION: Places a green circle of radius 64 at center (327, 125).
; PLAN: r0=327(x), r1=125(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 125
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
