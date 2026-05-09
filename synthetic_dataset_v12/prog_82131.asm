; DESCRIPTION: Composite: Renders a magenta disk with center (179, 152) and radius 64 then Draws a green line from (361, 136) to (354, 221) then Places a white dot at position (194, 121).
; PLAN: r0=179(x), r1=152(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x1), r6=136(y1), r7=354(x2), r8=221(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=121(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 152
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 136
LDI r7, 354
LDI r8, 221
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 121
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
