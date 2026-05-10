; DESCRIPTION: Composite: Sets a single cyan pixel at (268, 60) then Renders a cyan line between points (144, 29) and (236, 51) then Renders a orange box of size 53x102 starting at (457, 87).
; PLAN: r0=268(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=29(y1), r7=236(x2), r8=51(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=457(x), r11=87(y), r12=53(width), r13=102(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 29
LDI r7, 236
LDI r8, 51
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 87
LDI r12, 53
LDI r13, 102
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
