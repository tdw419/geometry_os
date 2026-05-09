; DESCRIPTION: Composite: Places a red dot at position (323, 152) then Places a white 92x64 rectangle at position (383, 36) then Creates a magenta circular shape at (359, 170) with radius 80.
; PLAN: r0=323(x), r1=152(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=36(y), r7=92(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x), r11=170(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 323
LDI r1, 152
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 383
LDI r6, 36
LDI r7, 92
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 170
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
