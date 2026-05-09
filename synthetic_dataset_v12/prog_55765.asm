; DESCRIPTION: Draws a white rectangle at (466, 187) with width 42 and height 30.
; PLAN: r0=466(x), r1=187(y), r2=42(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 187
LDI r2, 42
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
