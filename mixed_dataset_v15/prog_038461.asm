; DESCRIPTION: Draws a green rectangle at (243, 141) with width 71 and height 48.
; PLAN: r0=243(x), r1=141(y), r2=71(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 141
LDI r2, 71
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
