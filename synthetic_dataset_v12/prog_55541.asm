; DESCRIPTION: Composite: Draws a white line from (308, 192) to (0, 35) then Places a white 101x21 rectangle at position (175, 219).
; PLAN: r0=308(x1), r1=192(y1), r2=0(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=219(y), r7=101(width), r8=21(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 192
LDI r2, 0
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 219
LDI r7, 101
LDI r8, 21
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
