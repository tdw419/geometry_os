; DESCRIPTION: Composite: . Then Renders a green line between points (123, 11) and (125, 251). Then Creates a blue rectangular region at (211, 111) spanning 13 by 81 pixels.
; PLAN: r0=123(x1), r1=11(y1), r2=125(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=211(x), r1=111(y), r2=13(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (123, 11) and (125, 251).
; PLAN: r0=123(x1), r1=11(y1), r2=125(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 11
LDI r2, 125
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (211, 111) spanning 13 by 81 pixels.
; PLAN: r0=211(x), r1=111(y), r2=13(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 111
LDI r2, 13
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
