; DESCRIPTION: Composite: Renders a red line between points (1, 233) and (271, 53) then Places a black circle of radius 22 at center (152, 182).
; PLAN: r0=1(x1), r1=233(y1), r2=271(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=182(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 233
LDI r2, 271
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 182
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
