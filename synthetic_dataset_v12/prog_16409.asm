; DESCRIPTION: Composite: Renders a green box of size 83x74 starting at (209, 18) then Draws a black line from (276, 53) to (396, 115).
; PLAN: r0=209(x), r1=18(y), r2=83(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=53(y1), r7=396(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 18
LDI r2, 83
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 53
LDI r7, 396
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
