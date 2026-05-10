; DESCRIPTION: Composite: Draws a red line from (192, 32) to (83, 2) then Places a white 102x35 rectangle at position (331, 119).
; PLAN: r0=192(x1), r1=32(y1), r2=83(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=119(y), r7=102(width), r8=35(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 32
LDI r2, 83
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 119
LDI r7, 102
LDI r8, 35
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
