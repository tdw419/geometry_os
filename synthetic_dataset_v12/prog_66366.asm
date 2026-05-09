; DESCRIPTION: Composite: Renders a white box of size 48x107 starting at (121, 46) then Draws a red line from (11, 245) to (119, 213).
; PLAN: r0=121(x), r1=46(y), r2=48(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=245(y1), r7=119(x2), r8=213(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 46
LDI r2, 48
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 245
LDI r7, 119
LDI r8, 213
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
