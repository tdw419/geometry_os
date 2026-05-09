; DESCRIPTION: Draws a red rectangle at (146, 89) with width 85 and height 22.
; PLAN: r0=146(x), r1=89(y), r2=85(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 89
LDI r2, 85
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
