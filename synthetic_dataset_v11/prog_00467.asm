; DESCRIPTION: Composite: . Then Places a white 53x65 rectangle at position (106, 140). Then Places a magenta line segment connecting (15, 108) to (139, 138).
; PLAN: r0=106(x), r1=140(y), r2=53(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=15(x1), r1=108(y1), r2=139(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 53x65 rectangle at position (106, 140).
; PLAN: r0=106(x), r1=140(y), r2=53(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 140
LDI r2, 53
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (15, 108) to (139, 138).
; PLAN: r0=15(x1), r1=108(y1), r2=139(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 108
LDI r2, 139
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
