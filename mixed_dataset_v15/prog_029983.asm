; DESCRIPTION: Places a green 100x91 rectangle at position (272, 43).
; PLAN: r0=272(x), r1=43(y), r2=100(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 43
LDI r2, 100
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
