; DESCRIPTION: Draws a magenta rectangle at (298, 202) with width 66 and height 50.
; PLAN: r0=298(x), r1=202(y), r2=66(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 202
LDI r2, 66
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
