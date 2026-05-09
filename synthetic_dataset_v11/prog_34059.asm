; DESCRIPTION: Composite: . Then Creates a red rectangular region at (143, 167) spanning 93 by 62 pixels. Then Renders a red line between points (106, 156) and (83, 200).
; PLAN: r0=143(x), r1=167(y), r2=93(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x1), r1=156(y1), r2=83(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (143, 167) spanning 93 by 62 pixels.
; PLAN: r0=143(x), r1=167(y), r2=93(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 167
LDI r2, 93
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (106, 156) and (83, 200).
; PLAN: r0=106(x1), r1=156(y1), r2=83(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 156
LDI r2, 83
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
