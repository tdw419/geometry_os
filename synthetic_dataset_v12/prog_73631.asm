; DESCRIPTION: Draws a white rectangle at (262, 154) with width 75 and height 45.
; PLAN: r0=262(x), r1=154(y), r2=75(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 154
LDI r2, 75
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
