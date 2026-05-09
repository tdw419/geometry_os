; DESCRIPTION: Composite: Renders a yellow line between points (291, 183) and (20, 201) then Places a red 53x25 rectangle at position (204, 39).
; PLAN: r0=291(x1), r1=183(y1), r2=20(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=39(y), r7=53(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 183
LDI r2, 20
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 39
LDI r7, 53
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
