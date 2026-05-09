; DESCRIPTION: Composite: Draws a cyan line from (384, 160) to (425, 120) then Draws a white circle centered at (164, 188) with radius 55 then Places a green 87x80 rectangle at position (117, 86).
; PLAN: r0=384(x1), r1=160(y1), r2=425(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=188(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=86(y), r12=87(width), r13=80(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 160
LDI r2, 425
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 188
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 86
LDI r12, 87
LDI r13, 80
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
