; DESCRIPTION: Composite: . Then Places a magenta 34x119 rectangle at position (127, 11). Then Draws a yellow line from (246, 214) to (7, 146).
; PLAN: r0=127(x), r1=11(y), r2=34(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=246(x1), r1=214(y1), r2=7(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 34x119 rectangle at position (127, 11).
; PLAN: r0=127(x), r1=11(y), r2=34(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 11
LDI r2, 34
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (246, 214) to (7, 146).
; PLAN: r0=246(x1), r1=214(y1), r2=7(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 214
LDI r2, 7
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
