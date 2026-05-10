; DESCRIPTION: Composite: Creates a green circular shape at (242, 171) with radius 69 then Renders a green line between points (256, 165) and (242, 168) then Sets a single black pixel at (99, 221).
; PLAN: r0=242(x), r1=171(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x1), r6=165(y1), r7=242(x2), r8=168(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=221(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 171
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 165
LDI r7, 242
LDI r8, 168
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 221
LDI r12, 0x000000
PSET r10, r11, r12
HALT
