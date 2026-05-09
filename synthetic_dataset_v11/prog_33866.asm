; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (40, 41) spanning 14 by 31 pixels. Then Renders a orange line between points (127, 166) and (248, 168).
; PLAN: r0=40(x), r1=41(y), r2=14(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=127(x1), r1=166(y1), r2=248(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (40, 41) spanning 14 by 31 pixels.
; PLAN: r0=40(x), r1=41(y), r2=14(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 41
LDI r2, 14
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (127, 166) and (248, 168).
; PLAN: r0=127(x1), r1=166(y1), r2=248(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 166
LDI r2, 248
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
