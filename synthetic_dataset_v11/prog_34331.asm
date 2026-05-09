; DESCRIPTION: Composite: . Then Renders a red line between points (147, 21) and (16, 171). Then Creates a green rectangular region at (79, 126) spanning 118 by 103 pixels.
; PLAN: r0=147(x1), r1=21(y1), r2=16(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=79(x), r1=126(y), r2=118(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (147, 21) and (16, 171).
; PLAN: r0=147(x1), r1=21(y1), r2=16(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 21
LDI r2, 16
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (79, 126) spanning 118 by 103 pixels.
; PLAN: r0=79(x), r1=126(y), r2=118(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 126
LDI r2, 118
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
