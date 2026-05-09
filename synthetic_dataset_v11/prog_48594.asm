; DESCRIPTION: Places a black 83x48 rectangle at position (170, 13).
; PLAN: r0=170(x), r1=13(y), r2=83(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 13
LDI r2, 83
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
