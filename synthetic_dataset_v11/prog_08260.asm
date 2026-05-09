; DESCRIPTION: Composite: . Then Renders a purple box of size 19x25 starting at (56, 187). Then Places a magenta line segment connecting (111, 253) to (135, 165).
; PLAN: r0=56(x), r1=187(y), r2=19(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x1), r1=253(y1), r2=135(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple box of size 19x25 starting at (56, 187).
; PLAN: r0=56(x), r1=187(y), r2=19(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 187
LDI r2, 19
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (111, 253) to (135, 165).
; PLAN: r0=111(x1), r1=253(y1), r2=135(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 253
LDI r2, 135
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
