; DESCRIPTION: Composite: Creates a cyan rectangular region at (396, 10) spanning 107 by 61 pixels then Places a cyan line segment connecting (251, 220) to (401, 195) then Creates a blue circular shape at (487, 96) with radius 11.
; PLAN: r0=396(x), r1=10(y), r2=107(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x1), r6=220(y1), r7=401(x2), r8=195(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=487(x), r11=96(y), r12=11(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 10
LDI r2, 107
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 220
LDI r7, 401
LDI r8, 195
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 96
LDI r12, 11
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
