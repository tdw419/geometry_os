; DESCRIPTION: Composite: Places a red line segment connecting (295, 215) to (502, 149) then Creates a white circular shape at (87, 108) with radius 49.
; PLAN: r0=295(x1), r1=215(y1), r2=502(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=108(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 215
LDI r2, 502
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 108
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
