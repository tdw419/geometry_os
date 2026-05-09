; DESCRIPTION: Composite: Places a white line segment connecting (264, 48) to (302, 191) then Renders a white box of size 23x46 starting at (470, 109) then Places a cyan dot at position (135, 29).
; PLAN: r0=264(x1), r1=48(y1), r2=302(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=109(y), r7=23(width), r8=46(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=29(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 48
LDI r2, 302
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 109
LDI r7, 23
LDI r8, 46
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 29
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
