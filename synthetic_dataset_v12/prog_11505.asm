; DESCRIPTION: Draws a green rectangle at (42, 47) with width 96 and height 80.
; PLAN: r0=42(x), r1=47(y), r2=96(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 47
LDI r2, 96
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
