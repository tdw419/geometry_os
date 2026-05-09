; DESCRIPTION: Places a yellow 77x33 rectangle at position (313, 137).
; PLAN: r0=313(x), r1=137(y), r2=77(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 137
LDI r2, 77
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
