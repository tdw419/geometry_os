; DESCRIPTION: Draws a white rectangle at (446, 69) with width 30 and height 32.
; PLAN: r0=446(x), r1=69(y), r2=30(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 69
LDI r2, 30
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
