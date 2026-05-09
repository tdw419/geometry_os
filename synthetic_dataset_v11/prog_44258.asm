; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (226, 169) to (161, 221). Then Places a orange 65x43 rectangle at position (74, 15).
; PLAN: r0=226(x1), r1=169(y1), r2=161(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=74(x), r1=15(y), r2=65(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (226, 169) to (161, 221).
; PLAN: r0=226(x1), r1=169(y1), r2=161(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 169
LDI r2, 161
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 65x43 rectangle at position (74, 15).
; PLAN: r0=74(x), r1=15(y), r2=65(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 15
LDI r2, 65
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
