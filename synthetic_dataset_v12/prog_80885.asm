; DESCRIPTION: Draws a white rectangle at (446, 28) with width 39 and height 78.
; PLAN: r0=446(x), r1=28(y), r2=39(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 28
LDI r2, 39
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
