; DESCRIPTION: Places a yellow 52x37 rectangle at position (196, 59).
; PLAN: r0=196(x), r1=59(y), r2=52(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 59
LDI r2, 52
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
