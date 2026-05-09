; DESCRIPTION: Composite: Renders a cyan disk with center (173, 18) and radius 14 then Places a blue dot at position (7, 5) then Renders a red line between points (475, 77) and (428, 34).
; PLAN: r0=173(x), r1=18(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=5(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=475(x1), r11=77(y1), r12=428(x2), r13=34(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 18
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 5
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 475
LDI r11, 77
LDI r12, 428
LDI r13, 34
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
