; DESCRIPTION: Draws a white rectangle at (303, 27) with width 46 and height 99.
; PLAN: r0=303(x), r1=27(y), r2=46(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 27
LDI r2, 46
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
