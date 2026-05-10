; DESCRIPTION: Composite: Sets a single black pixel at (242, 125) then Renders a red box of size 19x68 starting at (382, 106) then Places a green line segment connecting (207, 149) to (437, 186).
; PLAN: r0=242(x), r1=125(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=106(y), r7=19(width), r8=68(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x1), r11=149(y1), r12=437(x2), r13=186(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 125
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 382
LDI r6, 106
LDI r7, 19
LDI r8, 68
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 149
LDI r12, 437
LDI r13, 186
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
