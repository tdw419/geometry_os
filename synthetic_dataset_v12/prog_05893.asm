; DESCRIPTION: Composite: Places a white line segment connecting (249, 143) to (153, 184) then Places a cyan 51x110 rectangle at position (0, 33).
; PLAN: r0=249(x1), r1=143(y1), r2=153(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=33(y), r7=51(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 143
LDI r2, 153
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 33
LDI r7, 51
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
