; DESCRIPTION: Composite: . Then Draws a blue line from (139, 142) to (98, 123). Then Renders a magenta box of size 42x111 starting at (100, 2).
; PLAN: r0=139(x1), r1=142(y1), r2=98(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=100(x), r1=2(y), r2=42(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (139, 142) to (98, 123).
; PLAN: r0=139(x1), r1=142(y1), r2=98(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 142
LDI r2, 98
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 42x111 starting at (100, 2).
; PLAN: r0=100(x), r1=2(y), r2=42(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 2
LDI r2, 42
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
