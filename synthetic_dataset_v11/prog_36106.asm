; DESCRIPTION: Composite: . Then Renders a cyan line between points (208, 196) and (47, 167). Then Draws a magenta rectangle at (98, 79) with width 46 and height 46.
; PLAN: r0=208(x1), r1=196(y1), r2=47(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=98(x), r1=79(y), r2=46(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (208, 196) and (47, 167).
; PLAN: r0=208(x1), r1=196(y1), r2=47(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 196
LDI r2, 47
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (98, 79) with width 46 and height 46.
; PLAN: r0=98(x), r1=79(y), r2=46(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 79
LDI r2, 46
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
