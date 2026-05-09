; DESCRIPTION: Draws a green rectangle at (21, 115) with width 42 and height 18.
; PLAN: r0=21(x), r1=115(y), r2=42(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 115
LDI r2, 42
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
