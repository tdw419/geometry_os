; DESCRIPTION: Places a green 95x81 rectangle at position (329, 135).
; PLAN: r0=329(x), r1=135(y), r2=95(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 135
LDI r2, 95
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
