; DESCRIPTION: Composite: Draws a purple line from (103, 201) to (298, 95) then Places a white circle of radius 46 at center (215, 117) then Places a white 57x41 rectangle at position (229, 153).
; PLAN: r0=103(x1), r1=201(y1), r2=298(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=117(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=229(x), r11=153(y), r12=57(width), r13=41(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 201
LDI r2, 298
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 117
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 229
LDI r11, 153
LDI r12, 57
LDI r13, 41
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
