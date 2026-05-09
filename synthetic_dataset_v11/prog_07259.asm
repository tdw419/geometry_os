; DESCRIPTION: Composite: . Then Places a magenta 20x48 rectangle at position (152, 144). Then Draws a black line from (231, 217) to (66, 251).
; PLAN: r0=152(x), r1=144(y), r2=20(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=231(x1), r1=217(y1), r2=66(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 20x48 rectangle at position (152, 144).
; PLAN: r0=152(x), r1=144(y), r2=20(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 144
LDI r2, 20
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (231, 217) to (66, 251).
; PLAN: r0=231(x1), r1=217(y1), r2=66(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 217
LDI r2, 66
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
