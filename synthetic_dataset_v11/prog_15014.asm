; DESCRIPTION: Composite: . Then Renders a black box of size 114x36 starting at (92, 134). Then Draws a magenta line from (213, 32) to (105, 137).
; PLAN: r0=92(x), r1=134(y), r2=114(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=213(x1), r1=32(y1), r2=105(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 114x36 starting at (92, 134).
; PLAN: r0=92(x), r1=134(y), r2=114(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 134
LDI r2, 114
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (213, 32) to (105, 137).
; PLAN: r0=213(x1), r1=32(y1), r2=105(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 32
LDI r2, 105
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
