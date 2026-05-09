; DESCRIPTION: Composite: Renders a orange box of size 61x51 starting at (124, 49) then Draws a white line from (0, 146) to (292, 176).
; PLAN: r0=124(x), r1=49(y), r2=61(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x1), r6=146(y1), r7=292(x2), r8=176(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 49
LDI r2, 61
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 146
LDI r7, 292
LDI r8, 176
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
