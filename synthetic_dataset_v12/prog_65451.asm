; DESCRIPTION: Composite: Renders a white line between points (432, 104) and (269, 178) then Places a cyan 27x25 rectangle at position (148, 88).
; PLAN: r0=432(x1), r1=104(y1), r2=269(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=88(y), r7=27(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 104
LDI r2, 269
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 88
LDI r7, 27
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
