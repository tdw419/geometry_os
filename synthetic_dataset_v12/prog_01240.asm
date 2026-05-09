; DESCRIPTION: Composite: Creates a green circular shape at (214, 163) with radius 55 then Sets a single purple pixel at (330, 186) then Renders a red line between points (444, 221) and (240, 192).
; PLAN: r0=214(x), r1=163(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=186(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=444(x1), r11=221(y1), r12=240(x2), r13=192(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 163
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 186
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 444
LDI r11, 221
LDI r12, 240
LDI r13, 192
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
