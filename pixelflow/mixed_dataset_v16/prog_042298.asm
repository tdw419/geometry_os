; DESCRIPTION: Composite: Places a black dot at position (242, 76) then Creates a red circular shape at (328, 195) with radius 13 then Renders a red line between points (450, 103) and (285, 177).
; PLAN: r0=242(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=195(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=450(x1), r11=103(y1), r12=285(x2), r13=177(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 328
LDI r6, 195
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 450
LDI r11, 103
LDI r12, 285
LDI r13, 177
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
