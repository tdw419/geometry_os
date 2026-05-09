; DESCRIPTION: Places a red circle of radius 47 at center (190, 50).
; PLAN: r0=190(x), r1=50(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 50
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
