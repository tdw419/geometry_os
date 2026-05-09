; DESCRIPTION: Draws a blue rectangle at (21, 221) with width 107 and height 20.
; PLAN: r0=21(x), r1=221(y), r2=107(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 221
LDI r2, 107
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
