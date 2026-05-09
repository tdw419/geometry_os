; DESCRIPTION: Composite: Draws a cyan line from (402, 94) to (108, 72) then Places a yellow 95x67 rectangle at position (185, 138).
; PLAN: r0=402(x1), r1=94(y1), r2=108(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=138(y), r7=95(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 94
LDI r2, 108
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 138
LDI r7, 95
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
