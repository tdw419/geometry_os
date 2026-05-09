; DESCRIPTION: Places a yellow 91x76 rectangle at position (58, 8).
; PLAN: r0=58(x), r1=8(y), r2=91(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 8
LDI r2, 91
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
