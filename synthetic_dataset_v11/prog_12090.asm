; DESCRIPTION: Composite: . Then Places a red circle of radius 60 at center (186, 106). Then Places a yellow 31x117 rectangle at position (186, 16).
; PLAN: r0=186(x), r1=106(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=186(x), r1=16(y), r2=31(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 60 at center (186, 106).
; PLAN: r0=186(x), r1=106(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 106
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 31x117 rectangle at position (186, 16).
; PLAN: r0=186(x), r1=16(y), r2=31(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 16
LDI r2, 31
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
