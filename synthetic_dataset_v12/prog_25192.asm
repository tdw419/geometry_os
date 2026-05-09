; DESCRIPTION: Composite: Renders a cyan line between points (251, 74) and (498, 44) then Places a red dot at position (413, 135) then Places a yellow 62x69 rectangle at position (354, 93).
; PLAN: r0=251(x1), r1=74(y1), r2=498(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=135(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=93(y), r12=62(width), r13=69(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 74
LDI r2, 498
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 135
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 354
LDI r11, 93
LDI r12, 62
LDI r13, 69
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
