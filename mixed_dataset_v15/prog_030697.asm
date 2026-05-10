; DESCRIPTION: Composite: Places a purple circle of radius 42 at center (298, 123) then Draws a purple line from (206, 197) to (345, 31) then Creates a cyan rectangular region at (365, 131) spanning 93 by 40 pixels.
; PLAN: r0=298(x), r1=123(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x1), r6=197(y1), r7=345(x2), r8=31(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=131(y), r12=93(width), r13=40(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 123
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 197
LDI r7, 345
LDI r8, 31
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 131
LDI r12, 93
LDI r13, 40
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
