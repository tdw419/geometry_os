; DESCRIPTION: Places a black 78x60 rectangle at position (160, 140).
; PLAN: r0=160(x), r1=140(y), r2=78(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 140
LDI r2, 78
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
