; DESCRIPTION: Composite: Sets a single green pixel at (128, 244) then Places a cyan 73x107 rectangle at position (247, 100) then Renders a black line between points (189, 27) and (60, 127).
; PLAN: r0=128(x), r1=244(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=100(y), r7=73(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x1), r11=27(y1), r12=60(x2), r13=127(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 244
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 247
LDI r6, 100
LDI r7, 73
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 27
LDI r12, 60
LDI r13, 127
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
