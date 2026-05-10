; DESCRIPTION: Places a black 109x56 rectangle at position (160, 76).
; PLAN: r0=160(x), r1=76(y), r2=109(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 76
LDI r2, 109
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
