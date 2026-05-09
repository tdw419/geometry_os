; DESCRIPTION: Composite: . Then Places a black dot at position (231, 195). Then Renders a black box of size 87x56 starting at (62, 69).
; PLAN: r0=231(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=62(x), r1=69(y), r2=87(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (231, 195).
; PLAN: r0=231(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 87x56 starting at (62, 69).
; PLAN: r0=62(x), r1=69(y), r2=87(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 69
LDI r2, 87
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
