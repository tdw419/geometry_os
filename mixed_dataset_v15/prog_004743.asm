; DESCRIPTION: Composite: Places a yellow line segment connecting (426, 7) to (339, 63) then Places a magenta 41x53 rectangle at position (145, 180).
; PLAN: r0=426(x1), r1=7(y1), r2=339(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=180(y), r7=41(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 7
LDI r2, 339
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 180
LDI r7, 41
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
