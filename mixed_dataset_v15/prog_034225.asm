; DESCRIPTION: Composite: Draws a red rectangle at (167, 155) with width 78 and height 47 then Draws a white line from (92, 214) to (263, 124) then Renders a cyan disk with center (482, 164) and radius 17.
; PLAN: r0=167(x), r1=155(y), r2=78(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x1), r6=214(y1), r7=263(x2), r8=124(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=482(x), r11=164(y), r12=17(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 155
LDI r2, 78
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 214
LDI r7, 263
LDI r8, 124
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 164
LDI r12, 17
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
