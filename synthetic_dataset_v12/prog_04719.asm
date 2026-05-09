; DESCRIPTION: Places a yellow 115x67 rectangle at position (77, 102).
; PLAN: r0=77(x), r1=102(y), r2=115(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 102
LDI r2, 115
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
