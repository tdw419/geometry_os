; DESCRIPTION: Composite: Places a yellow dot at position (4, 175) then Places a green 61x62 rectangle at position (406, 85).
; PLAN: r0=4(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=85(y), r7=61(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 406
LDI r6, 85
LDI r7, 61
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
