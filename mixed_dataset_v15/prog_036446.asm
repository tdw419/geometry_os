; DESCRIPTION: Composite: Places a orange 108x51 rectangle at position (52, 26) then Renders a white line between points (198, 227) and (124, 209).
; PLAN: r0=52(x), r1=26(y), r2=108(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x1), r6=227(y1), r7=124(x2), r8=209(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 26
LDI r2, 108
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 227
LDI r7, 124
LDI r8, 209
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
