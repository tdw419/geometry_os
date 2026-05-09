; DESCRIPTION: Composite: Creates a white circular shape at (412, 142) with radius 46 then Places a black line segment connecting (315, 223) to (171, 73) then Places a blue dot at position (1, 33).
; PLAN: r0=412(x), r1=142(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=223(y1), r7=171(x2), r8=73(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=1(x), r11=33(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 142
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 223
LDI r7, 171
LDI r8, 73
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 1
LDI r11, 33
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
