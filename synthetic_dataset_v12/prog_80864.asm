; DESCRIPTION: Places a green 97x86 rectangle at position (301, 100).
; PLAN: r0=301(x), r1=100(y), r2=97(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 100
LDI r2, 97
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
