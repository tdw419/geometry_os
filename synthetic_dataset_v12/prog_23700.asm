; DESCRIPTION: Composite: Places a blue 71x75 rectangle at position (211, 153) then Renders a black line between points (355, 67) and (90, 120).
; PLAN: r0=211(x), r1=153(y), r2=71(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=67(y1), r7=90(x2), r8=120(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 153
LDI r2, 71
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 67
LDI r7, 90
LDI r8, 120
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
