; DESCRIPTION: Places a black 59x30 rectangle at position (302, 222).
; PLAN: r0=302(x), r1=222(y), r2=59(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 222
LDI r2, 59
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
