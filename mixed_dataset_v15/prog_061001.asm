; DESCRIPTION: Draws a red rectangle at (38, 47) with width 84 and height 58.
; PLAN: r0=38(x), r1=47(y), r2=84(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 47
LDI r2, 84
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
