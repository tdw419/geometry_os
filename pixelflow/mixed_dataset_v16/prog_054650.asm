; DESCRIPTION: Composite: Sets a single magenta pixel at (464, 213) then Places a purple line segment connecting (509, 147) to (263, 79) then Draws a white rectangle at (224, 113) with width 45 and height 41.
; PLAN: r0=464(x), r1=213(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=147(y1), r7=263(x2), r8=79(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=224(x), r11=113(y), r12=45(width), r13=41(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 213
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 509
LDI r6, 147
LDI r7, 263
LDI r8, 79
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 113
LDI r12, 45
LDI r13, 41
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
