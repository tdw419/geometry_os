; DESCRIPTION: Draws a white rectangle at (277, 72) with width 92 and height 50.
; PLAN: r0=277(x), r1=72(y), r2=92(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 72
LDI r2, 92
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
