; DESCRIPTION: Composite: . Then Places a yellow 98x31 rectangle at position (154, 152). Then Renders a purple disk with center (59, 145) and radius 53.
; PLAN: r0=154(x), r1=152(y), r2=98(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=59(x), r1=145(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 98x31 rectangle at position (154, 152).
; PLAN: r0=154(x), r1=152(y), r2=98(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 152
LDI r2, 98
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (59, 145) and radius 53.
; PLAN: r0=59(x), r1=145(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 145
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
