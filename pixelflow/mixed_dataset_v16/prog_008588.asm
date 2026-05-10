; DESCRIPTION: Composite: Places a cyan dot at position (488, 47) then Places a cyan line segment connecting (218, 1) to (150, 85) then Renders a orange disk with center (404, 199) and radius 36.
; PLAN: r0=488(x), r1=47(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=218(x1), r6=1(y1), r7=150(x2), r8=85(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=404(x), r11=199(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 488
LDI r1, 47
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 1
LDI r7, 150
LDI r8, 85
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 404
LDI r11, 199
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
