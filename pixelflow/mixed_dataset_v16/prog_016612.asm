; DESCRIPTION: Places a yellow 40x55 box at position (58, 59).
; PLAN: r0=58(x), r1=59(y), r2=40(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 59
LDI r2, 40
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
