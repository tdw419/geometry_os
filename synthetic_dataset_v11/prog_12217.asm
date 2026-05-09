; DESCRIPTION: Composite: . Then Renders a purple line between points (34, 255) and (24, 168). Then Places a cyan 73x36 rectangle at position (40, 47).
; PLAN: r0=34(x1), r1=255(y1), r2=24(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=40(x), r1=47(y), r2=73(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (34, 255) and (24, 168).
; PLAN: r0=34(x1), r1=255(y1), r2=24(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 255
LDI r2, 24
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 73x36 rectangle at position (40, 47).
; PLAN: r0=40(x), r1=47(y), r2=73(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 47
LDI r2, 73
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
