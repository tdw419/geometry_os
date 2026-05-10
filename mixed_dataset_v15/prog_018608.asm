; DESCRIPTION: Composite: Places a yellow line segment connecting (333, 97) to (345, 70) then Places a cyan dot at position (277, 64) then Creates a yellow rectangular region at (315, 221) spanning 13 by 24 pixels.
; PLAN: r0=333(x1), r1=97(y1), r2=345(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=64(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=221(y), r12=13(width), r13=24(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 97
LDI r2, 345
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 64
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 315
LDI r11, 221
LDI r12, 13
LDI r13, 24
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
