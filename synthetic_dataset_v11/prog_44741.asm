; DESCRIPTION: Places a yellow 89x25 rectangle at position (151, 98).
; PLAN: r0=151(x), r1=98(y), r2=89(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 98
LDI r2, 89
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
