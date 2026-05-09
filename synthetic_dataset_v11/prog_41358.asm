; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (112, 68) spanning 69 by 26 pixels. Then Renders a yellow line between points (21, 226) and (235, 25).
; PLAN: r0=112(x), r1=68(y), r2=69(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=21(x1), r1=226(y1), r2=235(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (112, 68) spanning 69 by 26 pixels.
; PLAN: r0=112(x), r1=68(y), r2=69(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 68
LDI r2, 69
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (21, 226) and (235, 25).
; PLAN: r0=21(x1), r1=226(y1), r2=235(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 226
LDI r2, 235
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
