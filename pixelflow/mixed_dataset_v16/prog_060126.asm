; DESCRIPTION: Composite: Places a cyan 38x39 rectangle at position (413, 1) then Places a blue line segment connecting (446, 171) to (431, 163) then Places a white circle of radius 67 at center (241, 117).
; PLAN: r0=413(x), r1=1(y), r2=38(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=171(y1), r7=431(x2), r8=163(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=117(y), r12=67(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 413
LDI r1, 1
LDI r2, 38
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 171
LDI r7, 431
LDI r8, 163
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 117
LDI r12, 67
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
