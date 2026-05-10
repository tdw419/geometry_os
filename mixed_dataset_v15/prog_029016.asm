; DESCRIPTION: Composite: Creates a blue circular shape at (223, 178) with radius 70 then Places a cyan dot at position (446, 231) then Places a cyan line segment connecting (202, 246) to (156, 25).
; PLAN: r0=223(x), r1=178(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=231(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=202(x1), r11=246(y1), r12=156(x2), r13=25(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 178
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 231
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 202
LDI r11, 246
LDI r12, 156
LDI r13, 25
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
