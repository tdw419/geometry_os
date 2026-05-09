; DESCRIPTION: Composite: Draws a yellow rectangle at (57, 63) with width 34 and height 70 then Renders a white line between points (21, 229) and (215, 127).
; PLAN: r0=57(x), r1=63(y), r2=34(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x1), r6=229(y1), r7=215(x2), r8=127(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 63
LDI r2, 34
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 229
LDI r7, 215
LDI r8, 127
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
