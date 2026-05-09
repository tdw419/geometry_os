; DESCRIPTION: Composite: . Then Places a green circle of radius 58 at center (93, 65). Then Places a red 65x72 rectangle at position (74, 152).
; PLAN: r0=93(x), r1=65(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=74(x), r1=152(y), r2=65(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 58 at center (93, 65).
; PLAN: r0=93(x), r1=65(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 65
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 65x72 rectangle at position (74, 152).
; PLAN: r0=74(x), r1=152(y), r2=65(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 152
LDI r2, 65
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
