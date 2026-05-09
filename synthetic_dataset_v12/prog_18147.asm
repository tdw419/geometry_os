; DESCRIPTION: Composite: Creates a white rectangular region at (368, 203) spanning 40 by 51 pixels then Draws a white line from (403, 115) to (75, 217).
; PLAN: r0=368(x), r1=203(y), r2=40(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=115(y1), r7=75(x2), r8=217(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 203
LDI r2, 40
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 115
LDI r7, 75
LDI r8, 217
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
