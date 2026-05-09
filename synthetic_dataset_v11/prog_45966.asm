; DESCRIPTION: Composite: . Then Renders a magenta line between points (91, 100) and (244, 37). Then Renders a magenta box of size 39x116 starting at (36, 130).
; PLAN: r0=91(x1), r1=100(y1), r2=244(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=130(y), r2=39(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (91, 100) and (244, 37).
; PLAN: r0=91(x1), r1=100(y1), r2=244(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 100
LDI r2, 244
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 39x116 starting at (36, 130).
; PLAN: r0=36(x), r1=130(y), r2=39(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 130
LDI r2, 39
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
