; DESCRIPTION: Composite: . Then Renders a yellow box of size 44x109 starting at (63, 143). Then Renders a red line between points (153, 255) and (128, 99).
; PLAN: r0=63(x), r1=143(y), r2=44(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=153(x1), r1=255(y1), r2=128(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 44x109 starting at (63, 143).
; PLAN: r0=63(x), r1=143(y), r2=44(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 143
LDI r2, 44
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (153, 255) and (128, 99).
; PLAN: r0=153(x1), r1=255(y1), r2=128(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 255
LDI r2, 128
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
