; DESCRIPTION: Composite: . Then Draws a magenta line from (111, 164) to (147, 246). Then Places a yellow 11x91 rectangle at position (103, 141).
; PLAN: r0=111(x1), r1=164(y1), r2=147(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=141(y), r2=11(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (111, 164) to (147, 246).
; PLAN: r0=111(x1), r1=164(y1), r2=147(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 164
LDI r2, 147
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 11x91 rectangle at position (103, 141).
; PLAN: r0=103(x), r1=141(y), r2=11(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 141
LDI r2, 11
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
