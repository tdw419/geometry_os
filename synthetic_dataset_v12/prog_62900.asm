; DESCRIPTION: Draws a white rectangle at (410, 65) with width 72 and height 91.
; PLAN: r0=410(x), r1=65(y), r2=72(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 65
LDI r2, 72
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
