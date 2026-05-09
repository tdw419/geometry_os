; DESCRIPTION: Places a white circle of radius 17 at center (284, 222).
; PLAN: r0=284(x), r1=222(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 222
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
