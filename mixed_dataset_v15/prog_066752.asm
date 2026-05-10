; DESCRIPTION: Composite: Places a black line segment connecting (296, 214) to (250, 174) then Places a cyan 66x72 rectangle at position (60, 50).
; PLAN: r0=296(x1), r1=214(y1), r2=250(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=50(y), r7=66(width), r8=72(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 214
LDI r2, 250
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 50
LDI r7, 66
LDI r8, 72
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
