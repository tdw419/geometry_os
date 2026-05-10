; DESCRIPTION: Composite: Places a cyan 69x73 rectangle at position (345, 27) then Places a black line segment connecting (353, 160) to (475, 184).
; PLAN: r0=345(x), r1=27(y), r2=69(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x1), r6=160(y1), r7=475(x2), r8=184(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 27
LDI r2, 69
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 160
LDI r7, 475
LDI r8, 184
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
