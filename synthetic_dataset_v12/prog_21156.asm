; DESCRIPTION: Draws a white rectangle at (403, 45) with width 79 and height 54.
; PLAN: r0=403(x), r1=45(y), r2=79(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 45
LDI r2, 79
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
