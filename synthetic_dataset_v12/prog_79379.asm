; DESCRIPTION: Places a green 33x102 rectangle at position (233, 77).
; PLAN: r0=233(x), r1=77(y), r2=33(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 77
LDI r2, 33
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
