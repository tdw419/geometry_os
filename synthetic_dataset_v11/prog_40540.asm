; DESCRIPTION: Places a yellow 37x38 rectangle at position (196, 137).
; PLAN: r0=196(x), r1=137(y), r2=37(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 137
LDI r2, 37
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
