; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (67, 173) to (205, 234). Then Places a yellow dot at position (138, 96).
; PLAN: r0=67(x1), r1=173(y1), r2=205(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (67, 173) to (205, 234).
; PLAN: r0=67(x1), r1=173(y1), r2=205(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 173
LDI r2, 205
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (138, 96).
; PLAN: r0=138(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
