; DESCRIPTION: Composite: . Then Creates a white rectangular region at (170, 98) spanning 54 by 16 pixels. Then Renders a red line between points (157, 37) and (115, 185).
; PLAN: r0=170(x), r1=98(y), r2=54(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=157(x1), r1=37(y1), r2=115(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white rectangular region at (170, 98) spanning 54 by 16 pixels.
; PLAN: r0=170(x), r1=98(y), r2=54(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 98
LDI r2, 54
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (157, 37) and (115, 185).
; PLAN: r0=157(x1), r1=37(y1), r2=115(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 37
LDI r2, 115
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
