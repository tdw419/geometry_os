; DESCRIPTION: Composite: Renders a black line between points (449, 183) and (465, 4) then Places a white 105x68 rectangle at position (406, 34).
; PLAN: r0=449(x1), r1=183(y1), r2=465(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=34(y), r7=105(width), r8=68(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 449
LDI r1, 183
LDI r2, 465
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 34
LDI r7, 105
LDI r8, 68
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
