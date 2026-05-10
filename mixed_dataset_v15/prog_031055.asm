; DESCRIPTION: Draws a white rectangle at (445, 163) with width 65 and height 63.
; PLAN: r0=445(x), r1=163(y), r2=65(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 163
LDI r2, 65
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
