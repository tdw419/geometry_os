; DESCRIPTION: Composite: . Then Places a purple 101x32 rectangle at position (109, 46). Then Places a cyan line segment connecting (154, 16) to (151, 136).
; PLAN: r0=109(x), r1=46(y), r2=101(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=154(x1), r1=16(y1), r2=151(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple 101x32 rectangle at position (109, 46).
; PLAN: r0=109(x), r1=46(y), r2=101(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 46
LDI r2, 101
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (154, 16) to (151, 136).
; PLAN: r0=154(x1), r1=16(y1), r2=151(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 16
LDI r2, 151
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
