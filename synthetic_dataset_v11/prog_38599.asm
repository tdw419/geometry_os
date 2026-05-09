; DESCRIPTION: Composite: . Then Renders a cyan line between points (186, 30) and (95, 101). Then Places a purple 32x91 rectangle at position (36, 140).
; PLAN: r0=186(x1), r1=30(y1), r2=95(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=36(x), r1=140(y), r2=32(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (186, 30) and (95, 101).
; PLAN: r0=186(x1), r1=30(y1), r2=95(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 30
LDI r2, 95
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 32x91 rectangle at position (36, 140).
; PLAN: r0=36(x), r1=140(y), r2=32(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 140
LDI r2, 32
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
