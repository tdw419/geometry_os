; DESCRIPTION: Draws a red circle centered at (298, 190) with radius 64.
; PLAN: r0=298(x), r1=190(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 190
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
