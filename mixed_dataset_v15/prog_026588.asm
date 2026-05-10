; DESCRIPTION: Composite: Places a red 70x29 rectangle at position (148, 220) then Renders a black line between points (506, 218) and (370, 196).
; PLAN: r0=148(x), r1=220(y), r2=70(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x1), r6=218(y1), r7=370(x2), r8=196(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 220
LDI r2, 70
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 218
LDI r7, 370
LDI r8, 196
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
