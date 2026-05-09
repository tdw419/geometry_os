; DESCRIPTION: Composite: Places a white dot at position (291, 254) then Draws a black line from (157, 22) to (110, 196) then Renders a cyan box of size 62x24 starting at (263, 75).
; PLAN: r0=291(x), r1=254(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=22(y1), r7=110(x2), r8=196(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=75(y), r12=62(width), r13=24(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 254
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 22
LDI r7, 110
LDI r8, 196
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 75
LDI r12, 62
LDI r13, 24
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
