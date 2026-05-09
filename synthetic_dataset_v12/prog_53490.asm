; DESCRIPTION: Composite: Places a white 34x33 rectangle at position (234, 218) then Places a cyan line segment connecting (33, 97) to (484, 168).
; PLAN: r0=234(x), r1=218(y), r2=34(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=97(y1), r7=484(x2), r8=168(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 218
LDI r2, 34
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 97
LDI r7, 484
LDI r8, 168
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
