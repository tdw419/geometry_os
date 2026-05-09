; DESCRIPTION: Draws a red rectangle at (89, 59) with width 16 and height 72.
; PLAN: r0=89(x), r1=59(y), r2=16(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 59
LDI r2, 16
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
