; DESCRIPTION: Composite: Places a white 111x96 rectangle at position (333, 27) then Sets a single orange pixel at (79, 249) then Places a orange line segment connecting (462, 78) to (79, 124).
; PLAN: r0=333(x), r1=27(y), r2=111(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=249(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=462(x1), r11=78(y1), r12=79(x2), r13=124(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 27
LDI r2, 111
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 249
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 462
LDI r11, 78
LDI r12, 79
LDI r13, 124
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
