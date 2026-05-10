; DESCRIPTION: Composite: Draws a blue line from (19, 26) to (404, 57) then Draws a white circle centered at (324, 79) with radius 72 then Places a cyan 104x85 rectangle at position (394, 117).
; PLAN: r0=19(x1), r1=26(y1), r2=404(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=79(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x), r11=117(y), r12=104(width), r13=85(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 26
LDI r2, 404
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 79
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 117
LDI r12, 104
LDI r13, 85
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
