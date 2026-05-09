; DESCRIPTION: Composite: . Then Renders a black box of size 12x108 starting at (44, 131). Then Places a red line segment connecting (32, 124) to (157, 109).
; PLAN: r0=44(x), r1=131(y), r2=12(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x1), r1=124(y1), r2=157(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 12x108 starting at (44, 131).
; PLAN: r0=44(x), r1=131(y), r2=12(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 131
LDI r2, 12
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (32, 124) to (157, 109).
; PLAN: r0=32(x1), r1=124(y1), r2=157(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 124
LDI r2, 157
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
