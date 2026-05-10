; DESCRIPTION: Composite: Places a white line segment connecting (58, 70) to (377, 48) then Places a blue dot at position (504, 198).
; PLAN: r0=58(x1), r1=70(y1), r2=377(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=504(x), r6=198(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 58
LDI r1, 70
LDI r2, 377
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 198
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
