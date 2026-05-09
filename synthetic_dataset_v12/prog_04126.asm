; DESCRIPTION: Composite: Draws a orange line from (183, 64) to (307, 83) then Places a orange dot at position (406, 93) then Renders a black box of size 116x90 starting at (295, 124).
; PLAN: r0=183(x1), r1=64(y1), r2=307(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=93(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=124(y), r12=116(width), r13=90(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 64
LDI r2, 307
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 93
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 295
LDI r11, 124
LDI r12, 116
LDI r13, 90
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
