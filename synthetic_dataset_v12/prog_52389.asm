; DESCRIPTION: Draws a white rectangle at (161, 124) with width 70 and height 117.
; PLAN: r0=161(x), r1=124(y), r2=70(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 124
LDI r2, 70
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
