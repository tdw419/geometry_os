; DESCRIPTION: Composite: Places a orange 48x63 rectangle at position (387, 74) then Places a yellow line segment connecting (122, 124) to (315, 225).
; PLAN: r0=387(x), r1=74(y), r2=48(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=124(y1), r7=315(x2), r8=225(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 74
LDI r2, 48
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 124
LDI r7, 315
LDI r8, 225
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
