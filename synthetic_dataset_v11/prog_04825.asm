; DESCRIPTION: Composite: . Then Draws a red line from (167, 109) to (152, 157). Then Draws a cyan rectangle at (5, 69) with width 101 and height 51.
; PLAN: r0=167(x1), r1=109(y1), r2=152(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=5(x), r1=69(y), r2=101(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (167, 109) to (152, 157).
; PLAN: r0=167(x1), r1=109(y1), r2=152(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 109
LDI r2, 152
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (5, 69) with width 101 and height 51.
; PLAN: r0=5(x), r1=69(y), r2=101(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 69
LDI r2, 101
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
