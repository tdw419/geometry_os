; DESCRIPTION: Composite: . Then Places a orange 99x13 rectangle at position (133, 92). Then Places a green circle of radius 66 at center (100, 93).
; PLAN: r0=133(x), r1=92(y), r2=99(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=100(x), r1=93(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 99x13 rectangle at position (133, 92).
; PLAN: r0=133(x), r1=92(y), r2=99(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 92
LDI r2, 99
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 66 at center (100, 93).
; PLAN: r0=100(x), r1=93(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 93
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
