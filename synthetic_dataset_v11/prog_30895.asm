; DESCRIPTION: Composite: . Then Renders a cyan line between points (62, 82) and (133, 219). Then Places a red 21x109 rectangle at position (119, 114).
; PLAN: r0=62(x1), r1=82(y1), r2=133(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=119(x), r1=114(y), r2=21(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (62, 82) and (133, 219).
; PLAN: r0=62(x1), r1=82(y1), r2=133(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 82
LDI r2, 133
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red 21x109 rectangle at position (119, 114).
; PLAN: r0=119(x), r1=114(y), r2=21(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 114
LDI r2, 21
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
