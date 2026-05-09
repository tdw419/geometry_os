; DESCRIPTION: Places a yellow 17x90 rectangle at position (44, 119).
; PLAN: r0=44(x), r1=119(y), r2=17(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 119
LDI r2, 17
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
