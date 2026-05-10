; DESCRIPTION: Composite: Creates a yellow circular shape at (284, 172) with radius 50 then Places a green line segment connecting (329, 54) to (215, 78) then Places a magenta dot at position (22, 109).
; PLAN: r0=284(x), r1=172(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x1), r6=54(y1), r7=215(x2), r8=78(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=22(x), r11=109(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 172
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 54
LDI r7, 215
LDI r8, 78
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 109
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
