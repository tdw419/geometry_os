; DESCRIPTION: Composite: Creates a cyan rectangular region at (153, 171) spanning 16 by 27 pixels then Draws a white line from (186, 235) to (331, 227) then Places a red dot at position (496, 77).
; PLAN: r0=153(x), r1=171(y), r2=16(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x1), r6=235(y1), r7=331(x2), r8=227(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=496(x), r11=77(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 171
LDI r2, 16
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 235
LDI r7, 331
LDI r8, 227
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 77
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
