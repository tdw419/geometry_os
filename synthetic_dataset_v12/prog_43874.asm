; DESCRIPTION: Composite: Renders a red line between points (346, 102) and (82, 246) then Draws a red rectangle at (151, 61) with width 59 and height 87.
; PLAN: r0=346(x1), r1=102(y1), r2=82(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=61(y), r7=59(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 102
LDI r2, 82
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 61
LDI r7, 59
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
