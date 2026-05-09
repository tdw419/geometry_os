; DESCRIPTION: Draws a red rectangle at (77, 58) with width 50 and height 94.
; PLAN: r0=77(x), r1=58(y), r2=50(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 58
LDI r2, 50
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
