; DESCRIPTION: Composite: Places a red circle of radius 39 at center (401, 53) then Places a green line segment connecting (108, 59) to (397, 3) then Places a green dot at position (172, 39).
; PLAN: r0=401(x), r1=53(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x1), r6=59(y1), r7=397(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=39(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 53
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 59
LDI r7, 397
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 39
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
