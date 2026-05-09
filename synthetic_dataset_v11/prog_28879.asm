; DESCRIPTION: Composite: . Then Places a blue 33x20 rectangle at position (74, 125). Then Places a cyan line segment connecting (237, 128) to (93, 137).
; PLAN: r0=74(x), r1=125(y), r2=33(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=237(x1), r1=128(y1), r2=93(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 33x20 rectangle at position (74, 125).
; PLAN: r0=74(x), r1=125(y), r2=33(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 125
LDI r2, 33
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (237, 128) to (93, 137).
; PLAN: r0=237(x1), r1=128(y1), r2=93(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 128
LDI r2, 93
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
