; DESCRIPTION: Places a yellow 73x80 rectangle at position (107, 56).
; PLAN: r0=107(x), r1=56(y), r2=73(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 56
LDI r2, 73
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
