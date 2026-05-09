; DESCRIPTION: Composite: Sets a single white pixel at (464, 47) then Renders a yellow box of size 82x66 starting at (418, 76) then Places a black line segment connecting (489, 113) to (445, 118).
; PLAN: r0=464(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=76(y), r7=82(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x1), r11=113(y1), r12=445(x2), r13=118(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 418
LDI r6, 76
LDI r7, 82
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 113
LDI r12, 445
LDI r13, 118
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
