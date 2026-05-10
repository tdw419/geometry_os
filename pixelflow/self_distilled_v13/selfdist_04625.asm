; DESCRIPTION: Draws a green rectangle at (280, 112) with width 33 and height 87.
; PLAN: r0=280(x), r1=112(y), r2=33(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 112
LDI r2, 33
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
