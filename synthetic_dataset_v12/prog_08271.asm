; DESCRIPTION: Composite: Creates a cyan circular shape at (228, 199) with radius 54 then Places a cyan dot at position (68, 240) then Places a magenta line segment connecting (360, 150) to (268, 185).
; PLAN: r0=228(x), r1=199(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=240(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=360(x1), r11=150(y1), r12=268(x2), r13=185(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 199
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 240
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 360
LDI r11, 150
LDI r12, 268
LDI r13, 185
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
