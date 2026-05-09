; DESCRIPTION: Places a black 12x59 rectangle at position (313, 54).
; PLAN: r0=313(x), r1=54(y), r2=12(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 54
LDI r2, 12
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
