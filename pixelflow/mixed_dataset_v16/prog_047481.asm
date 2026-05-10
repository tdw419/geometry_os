; DESCRIPTION: Composite: Draws a red rectangle at (39, 176) with width 28 and height 25 then Draws a cyan line from (40, 69) to (466, 47).
; PLAN: r0=39(x), r1=176(y), r2=28(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x1), r6=69(y1), r7=466(x2), r8=47(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 176
LDI r2, 28
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 69
LDI r7, 466
LDI r8, 47
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
