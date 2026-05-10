; DESCRIPTION: Composite: Places a black 99x92 rectangle at position (210, 102) then Places a red line segment connecting (336, 84) to (48, 148).
; PLAN: r0=210(x), r1=102(y), r2=99(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=84(y1), r7=48(x2), r8=148(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 102
LDI r2, 99
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 84
LDI r7, 48
LDI r8, 148
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
