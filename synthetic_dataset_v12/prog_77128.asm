; DESCRIPTION: Composite: Renders a yellow box of size 102x98 starting at (277, 37) then Places a green line segment connecting (278, 133) to (139, 213).
; PLAN: r0=277(x), r1=37(y), r2=102(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=133(y1), r7=139(x2), r8=213(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 37
LDI r2, 102
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 133
LDI r7, 139
LDI r8, 213
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
