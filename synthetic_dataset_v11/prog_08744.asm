; DESCRIPTION: Composite: . Then Places a black line segment connecting (28, 29) to (237, 216). Then Places a cyan 11x93 rectangle at position (128, 46).
; PLAN: r0=28(x1), r1=29(y1), r2=237(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=46(y), r2=11(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black line segment connecting (28, 29) to (237, 216).
; PLAN: r0=28(x1), r1=29(y1), r2=237(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 29
LDI r2, 237
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan 11x93 rectangle at position (128, 46).
; PLAN: r0=128(x), r1=46(y), r2=11(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 46
LDI r2, 11
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
