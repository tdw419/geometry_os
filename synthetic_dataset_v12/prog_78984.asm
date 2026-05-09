; DESCRIPTION: Composite: Renders a white line between points (433, 127) and (436, 111) then Sets a single blue pixel at (95, 181) then Places a white 80x43 rectangle at position (401, 178).
; PLAN: r0=433(x1), r1=127(y1), r2=436(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=181(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=401(x), r11=178(y), r12=80(width), r13=43(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 127
LDI r2, 436
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 181
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 401
LDI r11, 178
LDI r12, 80
LDI r13, 43
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
