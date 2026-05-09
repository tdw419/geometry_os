; DESCRIPTION: Composite: Draws a black rectangle at (291, 61) with width 90 and height 92 then Renders a cyan line between points (276, 150) and (262, 92).
; PLAN: r0=291(x), r1=61(y), r2=90(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=150(y1), r7=262(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 61
LDI r2, 90
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 150
LDI r7, 262
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
