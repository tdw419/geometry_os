; DESCRIPTION: Draws a yellow rectangle at (146, 82) with width 90 and height 81.
; PLAN: r0=146(x), r1=82(y), r2=90(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 82
LDI r2, 90
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
