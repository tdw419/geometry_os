; DESCRIPTION: Composite: Places a white line segment connecting (487, 40) to (484, 166) then Renders a cyan box of size 88x70 starting at (295, 27) then Sets a single red pixel at (305, 192).
; PLAN: r0=487(x1), r1=40(y1), r2=484(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=27(y), r7=88(width), r8=70(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=192(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 487
LDI r1, 40
LDI r2, 484
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 27
LDI r7, 88
LDI r8, 70
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 192
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
