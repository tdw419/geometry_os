; DESCRIPTION: Places a red 17x99 rectangle at position (200, 65).
; PLAN: r0=200(x), r1=65(y), r2=17(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 65
LDI r2, 17
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
