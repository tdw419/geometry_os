; DESCRIPTION: Composite: Renders a white line between points (294, 237) and (106, 95) then Places a red dot at position (360, 154) then Creates a yellow rectangular region at (382, 150) spanning 28 by 37 pixels.
; PLAN: r0=294(x1), r1=237(y1), r2=106(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=154(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=382(x), r11=150(y), r12=28(width), r13=37(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 237
LDI r2, 106
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 154
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 382
LDI r11, 150
LDI r12, 28
LDI r13, 37
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
