; DESCRIPTION: Composite: Draws a white rectangle at (87, 143) with width 44 and height 77 then Draws a black line from (263, 142) to (42, 25).
; PLAN: r0=87(x), r1=143(y), r2=44(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=142(y1), r7=42(x2), r8=25(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 143
LDI r2, 44
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 142
LDI r7, 42
LDI r8, 25
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
