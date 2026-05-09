; DESCRIPTION: Composite: Places a white 16x22 rectangle at position (363, 67) then Places a blue line segment connecting (71, 9) to (74, 33).
; PLAN: r0=363(x), r1=67(y), r2=16(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x1), r6=9(y1), r7=74(x2), r8=33(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 67
LDI r2, 16
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 9
LDI r7, 74
LDI r8, 33
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
