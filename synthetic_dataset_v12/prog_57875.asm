; DESCRIPTION: Creates a white rectangular region at (290, 125) spanning 107 by 89 pixels.
; PLAN: r0=290(x), r1=125(y), r2=107(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 125
LDI r2, 107
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
