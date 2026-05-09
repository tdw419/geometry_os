; DESCRIPTION: Composite: . Then Draws a white line from (169, 96) to (177, 122). Then Draws a cyan rectangle at (92, 136) with width 67 and height 77.
; PLAN: r0=169(x1), r1=96(y1), r2=177(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=136(y), r2=67(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (169, 96) to (177, 122).
; PLAN: r0=169(x1), r1=96(y1), r2=177(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 96
LDI r2, 177
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (92, 136) with width 67 and height 77.
; PLAN: r0=92(x), r1=136(y), r2=67(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 136
LDI r2, 67
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
