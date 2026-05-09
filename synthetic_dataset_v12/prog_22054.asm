; DESCRIPTION: Places a red circle of radius 38 at center (43, 204).
; PLAN: r0=43(x), r1=204(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 204
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
