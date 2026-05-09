; DESCRIPTION: Composite: Draws a black circle centered at (284, 159) with radius 70 then Creates a orange rectangular region at (471, 76) spanning 24 by 82 pixels then Draws a green line from (331, 41) to (400, 103).
; PLAN: r0=284(x), r1=159(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x), r6=76(y), r7=24(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=41(y1), r12=400(x2), r13=103(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 159
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 76
LDI r7, 24
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 41
LDI r12, 400
LDI r13, 103
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
