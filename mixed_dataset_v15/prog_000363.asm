; DESCRIPTION: Places a magenta disk with center (168, 187) and radius 13.
; PLAN: r0=168(x), r1=187(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 187
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
