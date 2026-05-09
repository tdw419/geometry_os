; DESCRIPTION: Places a black circle of radius 25 at center (284, 202).
; PLAN: r0=284(x), r1=202(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 202
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
