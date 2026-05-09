; DESCRIPTION: Composite: Places a green line segment connecting (370, 48) to (274, 59) then Renders a cyan disk with center (248, 180) and radius 64 then Places a white dot at position (385, 248).
; PLAN: r0=370(x1), r1=48(y1), r2=274(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=180(y), r7=64(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=248(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 48
LDI r2, 274
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 180
LDI r7, 64
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 248
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
