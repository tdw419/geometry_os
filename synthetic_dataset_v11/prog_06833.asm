; DESCRIPTION: Composite: . Then Places a purple 101x30 rectangle at position (137, 183). Then Renders a cyan line between points (216, 84) and (39, 213).
; PLAN: r0=137(x), r1=183(y), r2=101(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=216(x1), r1=84(y1), r2=39(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 101x30 rectangle at position (137, 183).
; PLAN: r0=137(x), r1=183(y), r2=101(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 183
LDI r2, 101
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (216, 84) and (39, 213).
; PLAN: r0=216(x1), r1=84(y1), r2=39(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 84
LDI r2, 39
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
