; DESCRIPTION: Composite: . Then Renders a blue line between points (242, 111) and (112, 205). Then Places a black 90x102 rectangle at position (1, 7).
; PLAN: r0=242(x1), r1=111(y1), r2=112(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=1(x), r1=7(y), r2=90(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (242, 111) and (112, 205).
; PLAN: r0=242(x1), r1=111(y1), r2=112(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 111
LDI r2, 112
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 90x102 rectangle at position (1, 7).
; PLAN: r0=1(x), r1=7(y), r2=90(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 7
LDI r2, 90
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
