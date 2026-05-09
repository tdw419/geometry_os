; DESCRIPTION: Composite: Places a magenta line segment connecting (121, 146) to (429, 61) then Draws a red rectangle at (11, 28) with width 74 and height 24 then Sets a single magenta pixel at (73, 94).
; PLAN: r0=121(x1), r1=146(y1), r2=429(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=28(y), r7=74(width), r8=24(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x), r11=94(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 146
LDI r2, 429
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 28
LDI r7, 74
LDI r8, 24
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 94
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
