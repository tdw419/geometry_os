; DESCRIPTION: Composite: Draws a red circle centered at (264, 205) with radius 30 then Renders a white line between points (69, 111) and (327, 46) then Places a green dot at position (333, 147).
; PLAN: r0=264(x), r1=205(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x1), r6=111(y1), r7=327(x2), r8=46(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=147(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 205
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 111
LDI r7, 327
LDI r8, 46
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 147
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
