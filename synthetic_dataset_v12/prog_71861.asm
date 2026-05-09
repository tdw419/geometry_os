; DESCRIPTION: Composite: Places a blue line segment connecting (477, 62) to (245, 36) then Places a blue 48x38 rectangle at position (138, 129).
; PLAN: r0=477(x1), r1=62(y1), r2=245(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=129(y), r7=48(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 62
LDI r2, 245
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 129
LDI r7, 48
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
