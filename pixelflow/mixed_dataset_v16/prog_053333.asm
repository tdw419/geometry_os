; DESCRIPTION: Composite: Sets a single yellow pixel at (166, 45) then Draws a cyan rectangle at (90, 62) with width 42 and height 103 then Draws a purple line from (325, 74) to (317, 57).
; PLAN: r0=166(x), r1=45(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=62(y), r7=42(width), r8=103(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x1), r11=74(y1), r12=317(x2), r13=57(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 45
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 90
LDI r6, 62
LDI r7, 42
LDI r8, 103
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 74
LDI r12, 317
LDI r13, 57
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
