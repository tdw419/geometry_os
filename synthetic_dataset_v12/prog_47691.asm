; DESCRIPTION: Composite: Renders a magenta line between points (470, 18) and (413, 73) then Places a orange 41x34 rectangle at position (185, 167).
; PLAN: r0=470(x1), r1=18(y1), r2=413(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=167(y), r7=41(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 18
LDI r2, 413
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 167
LDI r7, 41
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
