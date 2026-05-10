; DESCRIPTION: Composite: Draws a black rectangle at (313, 82) with width 44 and height 32 then Sets a single yellow pixel at (198, 229) then Renders a cyan disk with center (148, 138) and radius 44.
; PLAN: r0=313(x), r1=82(y), r2=44(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=229(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=148(x), r11=138(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 313
LDI r1, 82
LDI r2, 44
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 229
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 148
LDI r11, 138
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
