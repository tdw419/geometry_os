; DESCRIPTION: Draws a white rectangle at (276, 131) with width 120 and height 65.
; PLAN: r0=276(x), r1=131(y), r2=120(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 131
LDI r2, 120
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
