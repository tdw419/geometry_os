; DESCRIPTION: Composite: Places a cyan line segment connecting (452, 63) to (276, 56) then Renders a black box of size 108x70 starting at (33, 63).
; PLAN: r0=452(x1), r1=63(y1), r2=276(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=63(y), r7=108(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 63
LDI r2, 276
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 63
LDI r7, 108
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
