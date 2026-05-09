; DESCRIPTION: Places a green circle of radius 78 at center (82, 173).
; PLAN: r0=82(x), r1=173(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 173
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
