; DESCRIPTION: Composite: Draws a black line from (281, 32) to (428, 74) then Renders a green box of size 58x25 starting at (184, 197).
; PLAN: r0=281(x1), r1=32(y1), r2=428(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=197(y), r7=58(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 32
LDI r2, 428
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 197
LDI r7, 58
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
