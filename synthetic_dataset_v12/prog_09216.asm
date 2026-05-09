; DESCRIPTION: Composite: Renders a cyan line between points (326, 161) and (431, 58) then Draws a magenta rectangle at (199, 21) with width 15 and height 117.
; PLAN: r0=326(x1), r1=161(y1), r2=431(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=21(y), r7=15(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 161
LDI r2, 431
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 21
LDI r7, 15
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
