; DESCRIPTION: Composite: Creates a purple rectangular region at (305, 138) spanning 81 by 74 pixels then Renders a green line between points (192, 197) and (87, 151).
; PLAN: r0=305(x), r1=138(y), r2=81(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x1), r6=197(y1), r7=87(x2), r8=151(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 138
LDI r2, 81
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 197
LDI r7, 87
LDI r8, 151
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
