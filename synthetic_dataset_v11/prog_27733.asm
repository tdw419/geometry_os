; DESCRIPTION: Composite: . Then Draws a orange line from (111, 123) to (223, 210). Then Renders a magenta box of size 115x100 starting at (138, 31).
; PLAN: r0=111(x1), r1=123(y1), r2=223(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=31(y), r2=115(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (111, 123) to (223, 210).
; PLAN: r0=111(x1), r1=123(y1), r2=223(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 123
LDI r2, 223
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 115x100 starting at (138, 31).
; PLAN: r0=138(x), r1=31(y), r2=115(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 31
LDI r2, 115
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
