; DESCRIPTION: Composite: . Then Renders a green line between points (64, 139) and (131, 110). Then Places a magenta 70x48 rectangle at position (58, 143).
; PLAN: r0=64(x1), r1=139(y1), r2=131(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=143(y), r2=70(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (64, 139) and (131, 110).
; PLAN: r0=64(x1), r1=139(y1), r2=131(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 139
LDI r2, 131
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta 70x48 rectangle at position (58, 143).
; PLAN: r0=58(x), r1=143(y), r2=70(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 143
LDI r2, 70
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
