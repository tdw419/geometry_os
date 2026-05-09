; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (107, 39) spanning 51 by 54 pixels. Then Renders a orange line between points (5, 204) and (72, 50).
; PLAN: r0=107(x), r1=39(y), r2=51(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=5(x1), r1=204(y1), r2=72(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (107, 39) spanning 51 by 54 pixels.
; PLAN: r0=107(x), r1=39(y), r2=51(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 39
LDI r2, 51
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (5, 204) and (72, 50).
; PLAN: r0=5(x1), r1=204(y1), r2=72(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 204
LDI r2, 72
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
