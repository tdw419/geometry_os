; DESCRIPTION: Places a black 20x59 rectangle at position (302, 55).
; PLAN: r0=302(x), r1=55(y), r2=20(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 55
LDI r2, 20
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
