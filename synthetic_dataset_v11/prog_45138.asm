; DESCRIPTION: Places a red circle of radius 64 at center (91, 172).
; PLAN: r0=91(x), r1=172(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 172
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
