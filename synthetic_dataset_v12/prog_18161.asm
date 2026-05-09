; DESCRIPTION: Draws a green rectangle at (146, 177) with width 73 and height 39.
; PLAN: r0=146(x), r1=177(y), r2=73(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 177
LDI r2, 73
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
