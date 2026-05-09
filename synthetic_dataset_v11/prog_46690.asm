; DESCRIPTION: Composite: . Then Draws a magenta line from (118, 64) to (181, 197). Then Places a blue 47x26 rectangle at position (165, 40).
; PLAN: r0=118(x1), r1=64(y1), r2=181(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=165(x), r1=40(y), r2=47(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (118, 64) to (181, 197).
; PLAN: r0=118(x1), r1=64(y1), r2=181(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 64
LDI r2, 181
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 47x26 rectangle at position (165, 40).
; PLAN: r0=165(x), r1=40(y), r2=47(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 40
LDI r2, 47
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
