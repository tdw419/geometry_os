; DESCRIPTION: Composite: Draws a magenta circle centered at (410, 124) with radius 59 then Places a black line segment connecting (365, 169) to (328, 116) then Places a purple dot at position (480, 107).
; PLAN: r0=410(x), r1=124(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x1), r6=169(y1), r7=328(x2), r8=116(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=480(x), r11=107(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 124
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 169
LDI r7, 328
LDI r8, 116
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 480
LDI r11, 107
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
