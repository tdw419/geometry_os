; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (183, 154) to (133, 44). Then Creates a cyan circular shape at (82, 53) with radius 29.
; PLAN: r0=183(x1), r1=154(y1), r2=133(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=53(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (183, 154) to (133, 44).
; PLAN: r0=183(x1), r1=154(y1), r2=133(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 154
LDI r2, 133
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (82, 53) with radius 29.
; PLAN: r0=82(x), r1=53(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 53
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
