; DESCRIPTION: Places a yellow 22x82 rectangle at position (34, 156).
; PLAN: r0=34(x), r1=156(y), r2=22(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 156
LDI r2, 22
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
