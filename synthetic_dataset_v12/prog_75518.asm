; DESCRIPTION: Composite: Places a white 100x22 rectangle at position (34, 94) then Draws a yellow line from (397, 133) to (446, 36).
; PLAN: r0=34(x), r1=94(y), r2=100(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x1), r6=133(y1), r7=446(x2), r8=36(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 94
LDI r2, 100
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 133
LDI r7, 446
LDI r8, 36
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
