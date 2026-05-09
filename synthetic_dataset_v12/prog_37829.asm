; DESCRIPTION: Draws a white rectangle at (403, 50) with width 66 and height 79.
; PLAN: r0=403(x), r1=50(y), r2=66(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 50
LDI r2, 66
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
