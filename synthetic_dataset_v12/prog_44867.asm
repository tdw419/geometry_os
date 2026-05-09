; DESCRIPTION: Composite: Renders a yellow disk with center (154, 76) and radius 24 then Renders a white line between points (246, 129) and (403, 160) then Places a green dot at position (380, 113).
; PLAN: r0=154(x), r1=76(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x1), r6=129(y1), r7=403(x2), r8=160(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=380(x), r11=113(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 76
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 129
LDI r7, 403
LDI r8, 160
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 380
LDI r11, 113
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
