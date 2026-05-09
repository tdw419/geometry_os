; DESCRIPTION: Composite: . Then Renders a blue line between points (201, 64) and (44, 186). Then Creates a yellow rectangular region at (150, 104) spanning 18 by 113 pixels.
; PLAN: r0=201(x1), r1=64(y1), r2=44(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=104(y), r2=18(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (201, 64) and (44, 186).
; PLAN: r0=201(x1), r1=64(y1), r2=44(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 64
LDI r2, 44
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (150, 104) spanning 18 by 113 pixels.
; PLAN: r0=150(x), r1=104(y), r2=18(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 104
LDI r2, 18
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
