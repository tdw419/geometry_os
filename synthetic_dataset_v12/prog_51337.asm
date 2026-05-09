; DESCRIPTION: Places a orange circle of radius 14 at center (404, 190).
; PLAN: r0=404(x), r1=190(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 190
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
