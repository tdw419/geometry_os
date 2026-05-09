; DESCRIPTION: Composite: Places a green 91x80 rectangle at position (4, 70) then Draws a black line from (349, 252) to (429, 161).
; PLAN: r0=4(x), r1=70(y), r2=91(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=252(y1), r7=429(x2), r8=161(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 70
LDI r2, 91
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 252
LDI r7, 429
LDI r8, 161
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
