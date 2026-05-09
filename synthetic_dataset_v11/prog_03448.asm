; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (186, 161) to (220, 7). Then Places a magenta circle of radius 67 at center (130, 73).
; PLAN: r0=186(x1), r1=161(y1), r2=220(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=130(x), r1=73(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan line segment connecting (186, 161) to (220, 7).
; PLAN: r0=186(x1), r1=161(y1), r2=220(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 161
LDI r2, 220
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 67 at center (130, 73).
; PLAN: r0=130(x), r1=73(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 73
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
