; DESCRIPTION: Composite: . Then Draws a magenta line from (228, 238) to (6, 213). Then Draws a green rectangle at (6, 238) with width 67 and height 17.
; PLAN: r0=228(x1), r1=238(y1), r2=6(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=6(x), r1=238(y), r2=67(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (228, 238) to (6, 213).
; PLAN: r0=228(x1), r1=238(y1), r2=6(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 238
LDI r2, 6
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (6, 238) with width 67 and height 17.
; PLAN: r0=6(x), r1=238(y), r2=67(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 238
LDI r2, 67
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
