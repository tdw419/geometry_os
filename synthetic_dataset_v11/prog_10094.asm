; DESCRIPTION: Composite: . Then Places a blue dot at position (250, 35). Then Renders a orange box of size 87x107 starting at (67, 126).
; PLAN: r0=250(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=67(x), r1=126(y), r2=87(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (250, 35).
; PLAN: r0=250(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 35
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 87x107 starting at (67, 126).
; PLAN: r0=67(x), r1=126(y), r2=87(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 126
LDI r2, 87
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
