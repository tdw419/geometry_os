; DESCRIPTION: Composite: Renders a cyan line between points (436, 211) and (241, 39) then Draws a magenta circle centered at (262, 219) with radius 14 then Sets a single white pixel at (116, 204).
; PLAN: r0=436(x1), r1=211(y1), r2=241(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=219(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x), r11=204(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 211
LDI r2, 241
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 219
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 204
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
