; DESCRIPTION: Composite: . Then Draws a white rectangle at (102, 29) with width 85 and height 33. Then Draws a white line from (144, 26) to (76, 239).
; PLAN: r0=102(x), r1=29(y), r2=85(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=144(x1), r1=26(y1), r2=76(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (102, 29) with width 85 and height 33.
; PLAN: r0=102(x), r1=29(y), r2=85(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 29
LDI r2, 85
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (144, 26) to (76, 239).
; PLAN: r0=144(x1), r1=26(y1), r2=76(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 26
LDI r2, 76
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
