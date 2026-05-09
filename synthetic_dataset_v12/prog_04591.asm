; DESCRIPTION: Composite: Creates a magenta rectangular region at (401, 92) spanning 53 by 100 pixels then Places a yellow line segment connecting (126, 179) to (493, 29).
; PLAN: r0=401(x), r1=92(y), r2=53(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=179(y1), r7=493(x2), r8=29(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 92
LDI r2, 53
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 179
LDI r7, 493
LDI r8, 29
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
