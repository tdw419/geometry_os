; DESCRIPTION: Composite: . Then Draws a green line from (60, 17) to (238, 143). Then Renders a magenta box of size 52x113 starting at (97, 75).
; PLAN: r0=60(x1), r1=17(y1), r2=238(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=75(y), r2=52(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (60, 17) to (238, 143).
; PLAN: r0=60(x1), r1=17(y1), r2=238(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 17
LDI r2, 238
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 52x113 starting at (97, 75).
; PLAN: r0=97(x), r1=75(y), r2=52(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 75
LDI r2, 52
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
