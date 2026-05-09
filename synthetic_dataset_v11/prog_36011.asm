; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (127, 21) with width 102 and height 109. Then Draws a yellow line from (79, 178) to (145, 25).
; PLAN: r0=127(x), r1=21(y), r2=102(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=79(x1), r1=178(y1), r2=145(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan rectangle at (127, 21) with width 102 and height 109.
; PLAN: r0=127(x), r1=21(y), r2=102(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 21
LDI r2, 102
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (79, 178) to (145, 25).
; PLAN: r0=79(x1), r1=178(y1), r2=145(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 178
LDI r2, 145
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
