; DESCRIPTION: Composite: Places a green dot at position (402, 67) then Renders a red line between points (65, 195) and (298, 204) then Renders a blue disk with center (406, 153) and radius 78.
; PLAN: r0=402(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=65(x1), r6=195(y1), r7=298(x2), r8=204(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=153(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 402
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 65
LDI r6, 195
LDI r7, 298
LDI r8, 204
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 153
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
