; DESCRIPTION: Creates a red circular shape at (180, 190) with radius 50.
; PLAN: r0=180(x), r1=190(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 190
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
