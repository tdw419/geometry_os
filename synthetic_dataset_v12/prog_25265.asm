; DESCRIPTION: Places a green 39x17 rectangle at position (97, 71).
; PLAN: r0=97(x), r1=71(y), r2=39(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 71
LDI r2, 39
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
