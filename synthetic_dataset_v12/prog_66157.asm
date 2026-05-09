; DESCRIPTION: Composite: Places a blue 79x19 rectangle at position (402, 44) then Draws a purple line from (380, 132) to (489, 32).
; PLAN: r0=402(x), r1=44(y), r2=79(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=132(y1), r7=489(x2), r8=32(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 44
LDI r2, 79
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 132
LDI r7, 489
LDI r8, 32
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
