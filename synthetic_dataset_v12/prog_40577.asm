; DESCRIPTION: Places a yellow 40x22 rectangle at position (272, 14).
; PLAN: r0=272(x), r1=14(y), r2=40(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 14
LDI r2, 40
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
