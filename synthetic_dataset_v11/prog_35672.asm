; DESCRIPTION: Composite: . Then Creates a green rectangular region at (118, 99) spanning 83 by 102 pixels. Then Renders a white line between points (95, 239) and (82, 34).
; PLAN: r0=118(x), r1=99(y), r2=83(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=95(x1), r1=239(y1), r2=82(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green rectangular region at (118, 99) spanning 83 by 102 pixels.
; PLAN: r0=118(x), r1=99(y), r2=83(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 99
LDI r2, 83
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (95, 239) and (82, 34).
; PLAN: r0=95(x1), r1=239(y1), r2=82(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 239
LDI r2, 82
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
