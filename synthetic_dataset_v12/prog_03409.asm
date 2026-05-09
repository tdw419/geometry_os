; DESCRIPTION: Places a yellow circle of radius 63 at center (401, 103).
; PLAN: r0=401(x), r1=103(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 103
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
