; DESCRIPTION: Composite: Renders a red disk with center (401, 188) and radius 25 then Places a yellow line segment connecting (388, 152) to (31, 208) then Places a black dot at position (299, 222).
; PLAN: r0=401(x), r1=188(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x1), r6=152(y1), r7=31(x2), r8=208(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=222(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 188
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 152
LDI r7, 31
LDI r8, 208
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 222
LDI r12, 0x000000
PSET r10, r11, r12
HALT
