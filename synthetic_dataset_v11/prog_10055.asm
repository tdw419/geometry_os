; DESCRIPTION: Composite: . Then Renders a magenta line between points (91, 30) and (141, 114). Then Creates a blue rectangular region at (123, 60) spanning 71 by 29 pixels.
; PLAN: r0=91(x1), r1=30(y1), r2=141(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=123(x), r1=60(y), r2=71(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (91, 30) and (141, 114).
; PLAN: r0=91(x1), r1=30(y1), r2=141(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 30
LDI r2, 141
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (123, 60) spanning 71 by 29 pixels.
; PLAN: r0=123(x), r1=60(y), r2=71(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 60
LDI r2, 71
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
