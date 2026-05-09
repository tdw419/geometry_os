; DESCRIPTION: Composite: . Then Renders a yellow line between points (190, 133) and (36, 125). Then Draws a magenta rectangle at (192, 49) with width 30 and height 93.
; PLAN: r0=190(x1), r1=133(y1), r2=36(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=192(x), r1=49(y), r2=30(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (190, 133) and (36, 125).
; PLAN: r0=190(x1), r1=133(y1), r2=36(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 133
LDI r2, 36
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (192, 49) with width 30 and height 93.
; PLAN: r0=192(x), r1=49(y), r2=30(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 49
LDI r2, 30
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
