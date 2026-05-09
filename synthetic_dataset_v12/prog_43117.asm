; DESCRIPTION: Draws a white rectangle at (47, 152) with width 93 and height 10.
; PLAN: r0=47(x), r1=152(y), r2=93(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 152
LDI r2, 93
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
