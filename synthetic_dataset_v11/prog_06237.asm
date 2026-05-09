; DESCRIPTION: Draws a white rectangle at (28, 71) with width 80 and height 42.
; PLAN: r0=28(x), r1=71(y), r2=80(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 71
LDI r2, 80
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
