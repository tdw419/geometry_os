; DESCRIPTION: Composite: Renders a yellow line between points (54, 23) and (31, 42) then Places a black 107x44 rectangle at position (222, 120).
; PLAN: r0=54(x1), r1=23(y1), r2=31(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=120(y), r7=107(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 23
LDI r2, 31
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 120
LDI r7, 107
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
