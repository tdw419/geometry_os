; DESCRIPTION: Composite: . Then Draws a black line from (205, 236) to (196, 160). Then Draws a white rectangle at (8, 57) with width 72 and height 109.
; PLAN: r0=205(x1), r1=236(y1), r2=196(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=8(x), r1=57(y), r2=72(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (205, 236) to (196, 160).
; PLAN: r0=205(x1), r1=236(y1), r2=196(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 236
LDI r2, 196
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (8, 57) with width 72 and height 109.
; PLAN: r0=8(x), r1=57(y), r2=72(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 57
LDI r2, 72
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
