; DESCRIPTION: Places a yellow 30x34 rectangle at position (166, 189).
; PLAN: r0=166(x), r1=189(y), r2=30(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 189
LDI r2, 30
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
