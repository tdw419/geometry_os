; DESCRIPTION: Places a green 68x74 rectangle at position (112, 84).
; PLAN: r0=112(x), r1=84(y), r2=68(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 84
LDI r2, 68
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
