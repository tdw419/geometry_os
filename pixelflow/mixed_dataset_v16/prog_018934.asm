; DESCRIPTION: Composite: Places a white 107x83 rectangle at position (114, 103) then Draws a white line from (157, 130) to (6, 235) then Places a black dot at position (328, 148).
; PLAN: r0=114(x), r1=103(y), r2=107(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x1), r6=130(y1), r7=6(x2), r8=235(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=148(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 114
LDI r1, 103
LDI r2, 107
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 130
LDI r7, 6
LDI r8, 235
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 148
LDI r12, 0x000000
PSET r10, r11, r12
HALT
