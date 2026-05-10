; DESCRIPTION: Composite: Places a black 13x32 rectangle at position (434, 19) then Draws a purple line from (9, 22) to (395, 250).
; PLAN: r0=434(x), r1=19(y), r2=13(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=22(y1), r7=395(x2), r8=250(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 19
LDI r2, 13
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 22
LDI r7, 395
LDI r8, 250
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
