; DESCRIPTION: Composite: Renders a cyan box of size 40x74 starting at (249, 10) then Draws a cyan line from (442, 47) to (413, 122).
; PLAN: r0=249(x), r1=10(y), r2=40(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x1), r6=47(y1), r7=413(x2), r8=122(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 10
LDI r2, 40
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 47
LDI r7, 413
LDI r8, 122
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
