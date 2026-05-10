; DESCRIPTION: Composite: Creates a black rectangular region at (62, 38) spanning 54 by 46 pixels then Draws a black line from (107, 27) to (308, 119).
; PLAN: r0=62(x), r1=38(y), r2=54(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x1), r6=27(y1), r7=308(x2), r8=119(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 38
LDI r2, 54
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 27
LDI r7, 308
LDI r8, 119
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
