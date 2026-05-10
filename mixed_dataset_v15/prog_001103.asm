; DESCRIPTION: Composite: Sets a single purple pixel at (452, 226) then Draws a white rectangle at (202, 7) with width 72 and height 93 then Places a white line segment connecting (495, 180) to (42, 124).
; PLAN: r0=452(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=7(y), r7=72(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=495(x1), r11=180(y1), r12=42(x2), r13=124(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 7
LDI r7, 72
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 180
LDI r12, 42
LDI r13, 124
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
