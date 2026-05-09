; DESCRIPTION: Composite: Places a red 107x62 rectangle at position (44, 20) then Places a cyan line segment connecting (42, 191) to (509, 168) then Places a red dot at position (296, 233).
; PLAN: r0=44(x), r1=20(y), r2=107(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x1), r6=191(y1), r7=509(x2), r8=168(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=233(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 20
LDI r2, 107
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 191
LDI r7, 509
LDI r8, 168
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 233
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
