; DESCRIPTION: Composite: Draws a red line from (492, 134) to (446, 180) then Renders a white box of size 120x78 starting at (37, 0).
; PLAN: r0=492(x1), r1=134(y1), r2=446(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=0(y), r7=120(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 134
LDI r2, 446
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 0
LDI r7, 120
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
