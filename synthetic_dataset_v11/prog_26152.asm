; DESCRIPTION: Composite: . Then Draws a black line from (81, 107) to (251, 148). Then Renders a green box of size 93x63 starting at (30, 186).
; PLAN: r0=81(x1), r1=107(y1), r2=251(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=30(x), r1=186(y), r2=93(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (81, 107) to (251, 148).
; PLAN: r0=81(x1), r1=107(y1), r2=251(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 107
LDI r2, 251
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 93x63 starting at (30, 186).
; PLAN: r0=30(x), r1=186(y), r2=93(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 186
LDI r2, 93
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
