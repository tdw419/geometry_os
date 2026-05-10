; DESCRIPTION: Draws a white rectangle at (308, 148) with width 120 and height 113.
; PLAN: r0=308(x), r1=148(y), r2=120(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 148
LDI r2, 120
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
