; DESCRIPTION: Places a white disk with center (260, 111) and radius 46.
; PLAN: r0=260(x), r1=111(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 111
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
