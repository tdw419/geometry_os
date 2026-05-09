; DESCRIPTION: Places a black circle of radius 13 at center (168, 228).
; PLAN: r0=168(x), r1=228(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 228
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
