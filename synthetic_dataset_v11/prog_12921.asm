; DESCRIPTION: Composite: . Then Renders a purple line between points (16, 201) and (7, 103). Then Places a cyan 94x65 rectangle at position (36, 53).
; PLAN: r0=16(x1), r1=201(y1), r2=7(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=53(y), r2=94(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (16, 201) and (7, 103).
; PLAN: r0=16(x1), r1=201(y1), r2=7(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 201
LDI r2, 7
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 94x65 rectangle at position (36, 53).
; PLAN: r0=36(x), r1=53(y), r2=94(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 53
LDI r2, 94
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
