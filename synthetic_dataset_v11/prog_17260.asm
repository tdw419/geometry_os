; DESCRIPTION: Composite: . Then Places a red 60x94 rectangle at position (159, 160). Then Places a cyan circle of radius 47 at center (110, 86).
; PLAN: r0=159(x), r1=160(y), r2=60(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=110(x), r1=86(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 60x94 rectangle at position (159, 160).
; PLAN: r0=159(x), r1=160(y), r2=60(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 160
LDI r2, 60
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 47 at center (110, 86).
; PLAN: r0=110(x), r1=86(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 86
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
