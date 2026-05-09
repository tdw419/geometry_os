; DESCRIPTION: Places a red circle of radius 17 at center (446, 43).
; PLAN: r0=446(x), r1=43(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 43
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
