; DESCRIPTION: Draws a red rectangle at (243, 24) with width 72 and height 98.
; PLAN: r0=243(x), r1=24(y), r2=72(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 24
LDI r2, 72
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
