; DESCRIPTION: Composite: Places a black circle of radius 53 at center (108, 157) then Draws a orange line from (72, 180) to (439, 154).
; PLAN: r0=108(x), r1=157(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x1), r6=180(y1), r7=439(x2), r8=154(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 157
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 180
LDI r7, 439
LDI r8, 154
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
