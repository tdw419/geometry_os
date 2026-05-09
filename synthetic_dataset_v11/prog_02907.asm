; DESCRIPTION: Draws a green rectangle at (146, 16) with width 86 and height 109.
; PLAN: r0=146(x), r1=16(y), r2=86(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 16
LDI r2, 86
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
