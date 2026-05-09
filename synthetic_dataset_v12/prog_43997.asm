; DESCRIPTION: Draws a white rectangle at (295, 112) with width 46 and height 45.
; PLAN: r0=295(x), r1=112(y), r2=46(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 112
LDI r2, 46
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
