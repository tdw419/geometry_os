; DESCRIPTION: Places a yellow 40x25 rectangle at position (153, 152).
; PLAN: r0=153(x), r1=152(y), r2=40(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 152
LDI r2, 40
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
