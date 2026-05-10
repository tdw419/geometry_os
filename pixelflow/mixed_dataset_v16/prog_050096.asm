; DESCRIPTION: Composite: Places a orange 13x41 rectangle at position (185, 122) then Sets a single red pixel at (38, 12) then Renders a white line between points (71, 223) and (403, 6).
; PLAN: r0=185(x), r1=122(y), r2=13(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=12(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=71(x1), r11=223(y1), r12=403(x2), r13=6(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 122
LDI r2, 13
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 12
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 71
LDI r11, 223
LDI r12, 403
LDI r13, 6
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
