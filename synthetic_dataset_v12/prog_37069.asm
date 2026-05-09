; DESCRIPTION: Places a yellow 17x59 rectangle at position (301, 80).
; PLAN: r0=301(x), r1=80(y), r2=17(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 80
LDI r2, 17
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
