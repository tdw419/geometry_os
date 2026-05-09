; DESCRIPTION: Draws a red circle centered at (394, 186) with radius 21.
; PLAN: r0=394(x), r1=186(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 186
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
