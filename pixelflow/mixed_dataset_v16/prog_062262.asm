; DESCRIPTION: Draws a red circle centered at (294, 25) with radius 79.
; PLAN: r0=294(x), r1=25(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 25
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
