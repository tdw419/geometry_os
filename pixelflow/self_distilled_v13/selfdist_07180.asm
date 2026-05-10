; DESCRIPTION: Draws a red rectangle at (229, 150) with width 98 and height 59.
; PLAN: r0=229(x), r1=150(y), r2=98(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 150
LDI r2, 98
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
