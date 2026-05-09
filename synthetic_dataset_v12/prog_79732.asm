; DESCRIPTION: Places a green 97x72 rectangle at position (73, 54).
; PLAN: r0=73(x), r1=54(y), r2=97(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 54
LDI r2, 97
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
