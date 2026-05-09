; DESCRIPTION: Places a magenta circle of radius 29 at center (366, 111).
; PLAN: r0=366(x), r1=111(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 111
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
