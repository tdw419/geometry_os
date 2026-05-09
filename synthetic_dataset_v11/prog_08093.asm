; DESCRIPTION: Composite: . Then Renders a purple line between points (180, 31) and (243, 150). Then Creates a green rectangular region at (114, 71) spanning 72 by 41 pixels.
; PLAN: r0=180(x1), r1=31(y1), r2=243(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=71(y), r2=72(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (180, 31) and (243, 150).
; PLAN: r0=180(x1), r1=31(y1), r2=243(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 31
LDI r2, 243
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (114, 71) spanning 72 by 41 pixels.
; PLAN: r0=114(x), r1=71(y), r2=72(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 71
LDI r2, 72
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
