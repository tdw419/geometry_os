; DESCRIPTION: Composite: . Then Places a blue dot at position (87, 203). Then Places a black 101x80 rectangle at position (56, 111).
; PLAN: r0=87(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=56(x), r1=111(y), r2=101(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (87, 203).
; PLAN: r0=87(x), r1=203(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 203
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a black 101x80 rectangle at position (56, 111).
; PLAN: r0=56(x), r1=111(y), r2=101(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 111
LDI r2, 101
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
