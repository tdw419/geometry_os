; DESCRIPTION: Composite: . Then Creates a white rectangular region at (11, 177) spanning 84 by 41 pixels. Then Draws a cyan line from (167, 100) to (220, 145).
; PLAN: r0=11(x), r1=177(y), r2=84(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=167(x1), r1=100(y1), r2=220(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white rectangular region at (11, 177) spanning 84 by 41 pixels.
; PLAN: r0=11(x), r1=177(y), r2=84(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 177
LDI r2, 84
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (167, 100) to (220, 145).
; PLAN: r0=167(x1), r1=100(y1), r2=220(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 100
LDI r2, 220
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
