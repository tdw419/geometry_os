; DESCRIPTION: Composite: . Then Renders a green box of size 107x76 starting at (136, 148). Then Draws a green line from (179, 211) to (30, 153).
; PLAN: r0=136(x), r1=148(y), r2=107(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x1), r1=211(y1), r2=30(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 107x76 starting at (136, 148).
; PLAN: r0=136(x), r1=148(y), r2=107(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 148
LDI r2, 107
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (179, 211) to (30, 153).
; PLAN: r0=179(x1), r1=211(y1), r2=30(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 211
LDI r2, 30
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
