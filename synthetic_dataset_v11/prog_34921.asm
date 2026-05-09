; DESCRIPTION: Composite: . Then Places a black line segment connecting (108, 98) to (93, 197). Then Places a purple 48x114 rectangle at position (81, 42).
; PLAN: r0=108(x1), r1=98(y1), r2=93(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=42(y), r2=48(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (108, 98) to (93, 197).
; PLAN: r0=108(x1), r1=98(y1), r2=93(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 98
LDI r2, 93
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 48x114 rectangle at position (81, 42).
; PLAN: r0=81(x), r1=42(y), r2=48(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 42
LDI r2, 48
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
