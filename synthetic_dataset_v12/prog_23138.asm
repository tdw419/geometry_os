; DESCRIPTION: Places a black circle of radius 46 at center (239, 192).
; PLAN: r0=239(x), r1=192(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 192
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
