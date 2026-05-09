; DESCRIPTION: Composite: . Then Renders a cyan line between points (86, 145) and (251, 46). Then Draws a magenta rectangle at (139, 127) with width 77 and height 15.
; PLAN: r0=86(x1), r1=145(y1), r2=251(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=139(x), r1=127(y), r2=77(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (86, 145) and (251, 46).
; PLAN: r0=86(x1), r1=145(y1), r2=251(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 145
LDI r2, 251
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (139, 127) with width 77 and height 15.
; PLAN: r0=139(x), r1=127(y), r2=77(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 127
LDI r2, 77
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
