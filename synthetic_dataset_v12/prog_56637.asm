; DESCRIPTION: Draws a white rectangle at (120, 134) with width 42 and height 92.
; PLAN: r0=120(x), r1=134(y), r2=42(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 134
LDI r2, 42
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
