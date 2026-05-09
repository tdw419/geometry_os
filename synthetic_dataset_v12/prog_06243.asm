; DESCRIPTION: Composite: Renders a orange box of size 63x92 starting at (123, 7) then Renders a white line between points (101, 168) and (141, 113) then Sets a single purple pixel at (477, 171).
; PLAN: r0=123(x), r1=7(y), r2=63(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x1), r6=168(y1), r7=141(x2), r8=113(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=477(x), r11=171(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 7
LDI r2, 63
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 168
LDI r7, 141
LDI r8, 113
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 171
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
