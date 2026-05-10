; DESCRIPTION: Draws a cyan circle centered at (400, 182) with radius 58.
; PLAN: r0=400(x), r1=182(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 182
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
