; DESCRIPTION: Composite: . Then Places a purple dot at position (229, 136). Then Places a orange 76x112 rectangle at position (13, 70).
; PLAN: r0=229(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=13(x), r1=70(y), r2=76(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (229, 136).
; PLAN: r0=229(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange 76x112 rectangle at position (13, 70).
; PLAN: r0=13(x), r1=70(y), r2=76(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 70
LDI r2, 76
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
