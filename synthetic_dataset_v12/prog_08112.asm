; DESCRIPTION: Places a yellow 60x39 rectangle at position (299, 97).
; PLAN: r0=299(x), r1=97(y), r2=60(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 97
LDI r2, 60
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
