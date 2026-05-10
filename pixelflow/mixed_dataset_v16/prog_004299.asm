; DESCRIPTION: Draws a white rectangle at (303, 132) with width 42 and height 80.
; PLAN: r0=303(x), r1=132(y), r2=42(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 132
LDI r2, 42
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
