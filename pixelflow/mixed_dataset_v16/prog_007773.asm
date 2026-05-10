; DESCRIPTION: Places a green 54x18 box at position (33, 102).
; PLAN: r0=33(x), r1=102(y), r2=54(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 102
LDI r2, 54
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
