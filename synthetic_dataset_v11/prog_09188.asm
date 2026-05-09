; DESCRIPTION: Composite: . Then Places a blue 111x55 rectangle at position (106, 24). Then Places a yellow line segment connecting (143, 202) to (111, 143).
; PLAN: r0=106(x), r1=24(y), r2=111(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=143(x1), r1=202(y1), r2=111(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 111x55 rectangle at position (106, 24).
; PLAN: r0=106(x), r1=24(y), r2=111(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 24
LDI r2, 111
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (143, 202) to (111, 143).
; PLAN: r0=143(x1), r1=202(y1), r2=111(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 202
LDI r2, 111
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
