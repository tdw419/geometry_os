; DESCRIPTION: Draws a red rectangle at (445, 61) with width 63 and height 13.
; PLAN: r0=445(x), r1=61(y), r2=63(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 61
LDI r2, 63
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
