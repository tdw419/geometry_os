; DESCRIPTION: Composite: . Then Renders a red line between points (210, 191) and (139, 153). Then Places a cyan 100x69 rectangle at position (21, 32).
; PLAN: r0=210(x1), r1=191(y1), r2=139(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=21(x), r1=32(y), r2=100(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (210, 191) and (139, 153).
; PLAN: r0=210(x1), r1=191(y1), r2=139(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 191
LDI r2, 139
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 100x69 rectangle at position (21, 32).
; PLAN: r0=21(x), r1=32(y), r2=100(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 32
LDI r2, 100
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
