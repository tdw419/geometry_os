; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (63, 74) with width 92 and height 31. Then Draws a white line from (196, 182) to (231, 116).
; PLAN: r0=63(x), r1=74(y), r2=92(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x1), r1=182(y1), r2=231(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (63, 74) with width 92 and height 31.
; PLAN: r0=63(x), r1=74(y), r2=92(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 74
LDI r2, 92
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (196, 182) to (231, 116).
; PLAN: r0=196(x1), r1=182(y1), r2=231(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 182
LDI r2, 231
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
