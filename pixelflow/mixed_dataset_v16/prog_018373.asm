; DESCRIPTION: Composite: Places a purple line segment connecting (327, 244) to (29, 139) then Places a cyan 13x48 rectangle at position (71, 84).
; PLAN: r0=327(x1), r1=244(y1), r2=29(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=84(y), r7=13(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 244
LDI r2, 29
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 84
LDI r7, 13
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
