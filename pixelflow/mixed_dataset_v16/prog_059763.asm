; DESCRIPTION: Composite: Places a cyan line segment connecting (488, 218) to (32, 27) then Places a red 86x62 rectangle at position (50, 170) then Places a magenta dot at position (417, 221).
; PLAN: r0=488(x1), r1=218(y1), r2=32(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=170(y), r7=86(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=417(x), r11=221(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 488
LDI r1, 218
LDI r2, 32
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 170
LDI r7, 86
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 417
LDI r11, 221
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
