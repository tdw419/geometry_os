; DESCRIPTION: Composite: . Then Places a cyan 77x14 rectangle at position (93, 240). Then Places a blue line segment connecting (209, 173) to (92, 123).
; PLAN: r0=93(x), r1=240(y), r2=77(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=209(x1), r1=173(y1), r2=92(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan 77x14 rectangle at position (93, 240).
; PLAN: r0=93(x), r1=240(y), r2=77(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 240
LDI r2, 77
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (209, 173) to (92, 123).
; PLAN: r0=209(x1), r1=173(y1), r2=92(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 173
LDI r2, 92
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
