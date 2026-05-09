; DESCRIPTION: Composite: Places a magenta dot at position (425, 173) then Places a purple circle of radius 39 at center (384, 81) then Renders a purple line between points (336, 225) and (345, 103).
; PLAN: r0=425(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=81(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=336(x1), r11=225(y1), r12=345(x2), r13=103(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 173
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 384
LDI r6, 81
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 336
LDI r11, 225
LDI r12, 345
LDI r13, 103
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
