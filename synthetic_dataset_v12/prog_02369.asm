; DESCRIPTION: Draws a red rectangle at (243, 20) with width 14 and height 32.
; PLAN: r0=243(x), r1=20(y), r2=14(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 20
LDI r2, 14
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
