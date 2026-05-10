; DESCRIPTION: Composite: Renders a cyan line between points (41, 213) and (189, 179) then Places a orange 13x62 rectangle at position (140, 186).
; PLAN: r0=41(x1), r1=213(y1), r2=189(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=186(y), r7=13(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 213
LDI r2, 189
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 186
LDI r7, 13
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
