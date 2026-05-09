; DESCRIPTION: Composite: Places a green 64x64 rectangle at position (304, 170) then Places a white dot at position (457, 78) then Draws a cyan line from (362, 16) to (47, 151).
; PLAN: r0=304(x), r1=170(y), r2=64(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=78(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=362(x1), r11=16(y1), r12=47(x2), r13=151(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 170
LDI r2, 64
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 78
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 362
LDI r11, 16
LDI r12, 47
LDI r13, 151
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
