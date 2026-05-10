; DESCRIPTION: Composite: Places a black 86x80 rectangle at position (402, 121) then Places a black line segment connecting (385, 180) to (79, 251).
; PLAN: r0=402(x), r1=121(y), r2=86(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x1), r6=180(y1), r7=79(x2), r8=251(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 121
LDI r2, 86
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 180
LDI r7, 79
LDI r8, 251
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
