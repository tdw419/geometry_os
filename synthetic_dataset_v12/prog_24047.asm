; DESCRIPTION: Places a yellow 16x77 rectangle at position (196, 84).
; PLAN: r0=196(x), r1=84(y), r2=16(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 84
LDI r2, 16
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
