; DESCRIPTION: Composite: Places a black 20x17 rectangle at position (265, 226) then Draws a black line from (33, 26) to (130, 139).
; PLAN: r0=265(x), r1=226(y), r2=20(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=26(y1), r7=130(x2), r8=139(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 226
LDI r2, 20
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 26
LDI r7, 130
LDI r8, 139
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
