; DESCRIPTION: Composite: Renders a white line between points (2, 195) and (387, 170) then Renders a orange box of size 95x52 starting at (225, 127).
; PLAN: r0=2(x1), r1=195(y1), r2=387(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=127(y), r7=95(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 2
LDI r1, 195
LDI r2, 387
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 127
LDI r7, 95
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
