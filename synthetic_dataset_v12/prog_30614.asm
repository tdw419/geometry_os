; DESCRIPTION: Places a yellow 91x108 rectangle at position (61, 5).
; PLAN: r0=61(x), r1=5(y), r2=91(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 5
LDI r2, 91
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
