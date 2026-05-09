; DESCRIPTION: Places a black 44x72 rectangle at position (144, 65).
; PLAN: r0=144(x), r1=65(y), r2=44(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 65
LDI r2, 44
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
