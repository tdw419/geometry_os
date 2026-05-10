; DESCRIPTION: Composite: Places a cyan circle of radius 64 at center (75, 131) then Renders a magenta box of size 104x89 starting at (397, 10) then Renders a red line between points (405, 132) and (472, 192).
; PLAN: r0=75(x), r1=131(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=10(y), r7=104(width), r8=89(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x1), r11=132(y1), r12=472(x2), r13=192(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 131
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 10
LDI r7, 104
LDI r8, 89
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 132
LDI r12, 472
LDI r13, 192
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
