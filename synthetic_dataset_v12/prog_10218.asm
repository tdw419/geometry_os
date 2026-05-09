; DESCRIPTION: Places a yellow 40x61 rectangle at position (414, 30).
; PLAN: r0=414(x), r1=30(y), r2=40(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 30
LDI r2, 40
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
