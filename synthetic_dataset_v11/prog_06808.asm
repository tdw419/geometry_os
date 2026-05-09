; DESCRIPTION: Composite: . Then Draws a white rectangle at (25, 77) with width 32 and height 92. Then Draws a red line from (220, 235) to (37, 82).
; PLAN: r0=25(x), r1=77(y), r2=32(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=220(x1), r1=235(y1), r2=37(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (25, 77) with width 32 and height 92.
; PLAN: r0=25(x), r1=77(y), r2=32(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 77
LDI r2, 32
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red line from (220, 235) to (37, 82).
; PLAN: r0=220(x1), r1=235(y1), r2=37(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 235
LDI r2, 37
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
