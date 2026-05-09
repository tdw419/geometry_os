; DESCRIPTION: Composite: Draws a magenta line from (392, 71) to (433, 26) then Creates a red circular shape at (112, 200) with radius 50 then Places a red 69x103 rectangle at position (253, 124).
; PLAN: r0=392(x1), r1=71(y1), r2=433(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=200(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x), r11=124(y), r12=69(width), r13=103(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 71
LDI r2, 433
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 200
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 124
LDI r12, 69
LDI r13, 103
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
