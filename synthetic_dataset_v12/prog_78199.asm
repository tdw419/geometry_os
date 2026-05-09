; DESCRIPTION: Composite: Places a red 13x94 rectangle at position (24, 20) then Draws a green line from (107, 239) to (431, 198).
; PLAN: r0=24(x), r1=20(y), r2=13(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x1), r6=239(y1), r7=431(x2), r8=198(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 20
LDI r2, 13
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 239
LDI r7, 431
LDI r8, 198
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
