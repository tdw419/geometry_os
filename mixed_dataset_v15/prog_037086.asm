; DESCRIPTION: Draws a blue rectangle at (281, 202) with width 45 and height 39.
; PLAN: r0=281(x), r1=202(y), r2=45(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 202
LDI r2, 45
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
