; DESCRIPTION: Composite: Places a white line segment connecting (345, 184) to (1, 225) then Places a magenta 92x59 rectangle at position (169, 10).
; PLAN: r0=345(x1), r1=184(y1), r2=1(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=10(y), r7=92(width), r8=59(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 184
LDI r2, 1
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 10
LDI r7, 92
LDI r8, 59
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
