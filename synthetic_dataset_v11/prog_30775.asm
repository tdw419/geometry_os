; DESCRIPTION: Composite: . Then Places a green line segment connecting (136, 203) to (239, 5). Then Places a green dot at position (49, 203).
; PLAN: r0=136(x1), r1=203(y1), r2=239(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=49(x), r1=203(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (136, 203) to (239, 5).
; PLAN: r0=136(x1), r1=203(y1), r2=239(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 203
LDI r2, 239
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (49, 203).
; PLAN: r0=49(x), r1=203(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 203
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
