; DESCRIPTION: Composite: . Then Draws a green line from (182, 160) to (108, 182). Then Draws a red rectangle at (15, 167) with width 105 and height 31.
; PLAN: r0=182(x1), r1=160(y1), r2=108(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=15(x), r1=167(y), r2=105(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (182, 160) to (108, 182).
; PLAN: r0=182(x1), r1=160(y1), r2=108(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 160
LDI r2, 108
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (15, 167) with width 105 and height 31.
; PLAN: r0=15(x), r1=167(y), r2=105(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 167
LDI r2, 105
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
