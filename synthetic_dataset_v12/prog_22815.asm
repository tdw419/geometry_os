; DESCRIPTION: Composite: Renders a red line between points (216, 186) and (295, 190) then Places a blue dot at position (293, 91) then Renders a magenta box of size 110x105 starting at (202, 32).
; PLAN: r0=216(x1), r1=186(y1), r2=295(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=91(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=202(x), r11=32(y), r12=110(width), r13=105(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 186
LDI r2, 295
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 91
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 202
LDI r11, 32
LDI r12, 110
LDI r13, 105
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
