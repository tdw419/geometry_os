; DESCRIPTION: Renders a white rectangular region spanning 38 by 79 at (290, 148).
; PLAN: r0=290(x), r1=148(y), r2=38(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 148
LDI r2, 38
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
