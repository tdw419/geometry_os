; DESCRIPTION: Composite: Draws a blue line from (475, 16) to (209, 60) then Draws a white circle centered at (91, 25) with radius 19 then Places a cyan 77x35 rectangle at position (412, 70).
; PLAN: r0=475(x1), r1=16(y1), r2=209(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=25(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=412(x), r11=70(y), r12=77(width), r13=35(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 475
LDI r1, 16
LDI r2, 209
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 25
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 412
LDI r11, 70
LDI r12, 77
LDI r13, 35
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
