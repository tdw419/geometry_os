; DESCRIPTION: Composite: Places a white circle of radius 38 at center (416, 196) then Places a white dot at position (503, 57) then Places a red line segment connecting (427, 187) to (432, 146).
; PLAN: r0=416(x), r1=196(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x), r6=57(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=427(x1), r11=187(y1), r12=432(x2), r13=146(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 196
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 57
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 427
LDI r11, 187
LDI r12, 432
LDI r13, 146
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
