; DESCRIPTION: Composite: . Then Sets a single blue pixel at (203, 198). Then Places a white 71x46 rectangle at position (137, 54).
; PLAN: r0=203(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=137(x), r1=54(y), r2=71(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (203, 198).
; PLAN: r0=203(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a white 71x46 rectangle at position (137, 54).
; PLAN: r0=137(x), r1=54(y), r2=71(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 54
LDI r2, 71
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
