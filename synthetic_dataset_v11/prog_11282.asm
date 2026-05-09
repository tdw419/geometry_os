; DESCRIPTION: Places a yellow 90x59 rectangle at position (76, 188).
; PLAN: r0=76(x), r1=188(y), r2=90(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 188
LDI r2, 90
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
