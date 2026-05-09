; DESCRIPTION: Places a green 33x77 rectangle at position (158, 0).
; PLAN: r0=158(x), r1=0(y), r2=33(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 0
LDI r2, 33
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
