; DESCRIPTION: Places a green 33x81 rectangle at position (174, 84).
; PLAN: r0=174(x), r1=84(y), r2=33(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 84
LDI r2, 33
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
