; DESCRIPTION: Places a yellow 117x59 rectangle at position (244, 0).
; PLAN: r0=244(x), r1=0(y), r2=117(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 0
LDI r2, 117
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
