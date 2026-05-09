; DESCRIPTION: Composite: Places a orange 81x61 rectangle at position (294, 109) then Renders a green line between points (468, 254) and (84, 43).
; PLAN: r0=294(x), r1=109(y), r2=81(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x1), r6=254(y1), r7=84(x2), r8=43(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 109
LDI r2, 81
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 254
LDI r7, 84
LDI r8, 43
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
