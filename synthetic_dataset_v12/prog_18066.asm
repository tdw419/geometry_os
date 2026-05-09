; DESCRIPTION: Draws a purple rectangle at (146, 195) with width 94 and height 54.
; PLAN: r0=146(x), r1=195(y), r2=94(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 195
LDI r2, 94
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
