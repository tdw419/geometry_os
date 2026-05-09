; DESCRIPTION: Places a red circle of radius 59 at center (212, 176).
; PLAN: r0=212(x), r1=176(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 176
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
