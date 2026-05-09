; DESCRIPTION: Composite: . Then Renders a orange line between points (129, 89) and (154, 29). Then Creates a white rectangular region at (105, 157) spanning 51 by 46 pixels.
; PLAN: r0=129(x1), r1=89(y1), r2=154(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=105(x), r1=157(y), r2=51(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (129, 89) and (154, 29).
; PLAN: r0=129(x1), r1=89(y1), r2=154(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 89
LDI r2, 154
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (105, 157) spanning 51 by 46 pixels.
; PLAN: r0=105(x), r1=157(y), r2=51(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 157
LDI r2, 51
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
