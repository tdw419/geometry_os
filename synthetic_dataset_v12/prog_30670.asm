; DESCRIPTION: Composite: Renders a yellow box of size 14x40 starting at (414, 214) then Draws a white line from (248, 224) to (420, 48) then Places a cyan circle of radius 57 at center (403, 104).
; PLAN: r0=414(x), r1=214(y), r2=14(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x1), r6=224(y1), r7=420(x2), r8=48(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=403(x), r11=104(y), r12=57(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 214
LDI r2, 14
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 224
LDI r7, 420
LDI r8, 48
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 104
LDI r12, 57
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
