; DESCRIPTION: Composite: . Then Places a blue line segment connecting (38, 177) to (195, 28). Then Places a cyan 110x117 rectangle at position (48, 25).
; PLAN: r0=38(x1), r1=177(y1), r2=195(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=48(x), r1=25(y), r2=110(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (38, 177) to (195, 28).
; PLAN: r0=38(x1), r1=177(y1), r2=195(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 177
LDI r2, 195
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 110x117 rectangle at position (48, 25).
; PLAN: r0=48(x), r1=25(y), r2=110(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 25
LDI r2, 110
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
