; DESCRIPTION: Composite: Creates a red circular shape at (268, 178) with radius 37 then Draws a white line from (280, 231) to (70, 117) then Places a orange 92x19 rectangle at position (180, 139).
; PLAN: r0=268(x), r1=178(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x1), r6=231(y1), r7=70(x2), r8=117(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=139(y), r12=92(width), r13=19(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 178
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 231
LDI r7, 70
LDI r8, 117
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 139
LDI r12, 92
LDI r13, 19
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
