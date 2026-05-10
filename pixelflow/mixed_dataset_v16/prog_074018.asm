; DESCRIPTION: Places a green 26x11 rectangle at position (321, 196).
; PLAN: r0=321(x), r1=196(y), r2=26(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 196
LDI r2, 26
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
