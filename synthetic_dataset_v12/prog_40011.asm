; DESCRIPTION: Composite: Places a red dot at position (210, 53) then Renders a green box of size 98x98 starting at (108, 147) then Draws a green circle centered at (198, 176) with radius 24.
; PLAN: r0=210(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=147(y), r7=98(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=176(y), r12=24(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 210
LDI r1, 53
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 108
LDI r6, 147
LDI r7, 98
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 176
LDI r12, 24
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
