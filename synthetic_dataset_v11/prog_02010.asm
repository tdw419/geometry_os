; DESCRIPTION: Composite: . Then Renders a green line between points (222, 125) and (226, 134). Then Creates a orange rectangular region at (50, 38) spanning 115 by 78 pixels.
; PLAN: r0=222(x1), r1=125(y1), r2=226(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=50(x), r1=38(y), r2=115(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (222, 125) and (226, 134).
; PLAN: r0=222(x1), r1=125(y1), r2=226(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 125
LDI r2, 226
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange rectangular region at (50, 38) spanning 115 by 78 pixels.
; PLAN: r0=50(x), r1=38(y), r2=115(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 38
LDI r2, 115
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
