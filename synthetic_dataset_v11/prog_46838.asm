; DESCRIPTION: Composite: . Then Renders a red line between points (14, 132) and (162, 113). Then Creates a yellow rectangular region at (19, 98) spanning 12 by 117 pixels.
; PLAN: r0=14(x1), r1=132(y1), r2=162(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=19(x), r1=98(y), r2=12(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (14, 132) and (162, 113).
; PLAN: r0=14(x1), r1=132(y1), r2=162(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 132
LDI r2, 162
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (19, 98) spanning 12 by 117 pixels.
; PLAN: r0=19(x), r1=98(y), r2=12(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 98
LDI r2, 12
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
