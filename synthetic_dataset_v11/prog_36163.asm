; DESCRIPTION: Places a yellow 62x44 rectangle at position (65, 156).
; PLAN: r0=65(x), r1=156(y), r2=62(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 156
LDI r2, 62
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
