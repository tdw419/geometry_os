; DESCRIPTION: Composite: Places a red line segment connecting (2, 167) to (279, 1) then Places a green dot at position (226, 196) then Places a cyan 93x56 rectangle at position (15, 12).
; PLAN: r0=2(x1), r1=167(y1), r2=279(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=196(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=12(y), r12=93(width), r13=56(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 167
LDI r2, 279
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 196
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 15
LDI r11, 12
LDI r12, 93
LDI r13, 56
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
