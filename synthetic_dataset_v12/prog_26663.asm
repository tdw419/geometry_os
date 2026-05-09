; DESCRIPTION: Places a green 102x54 rectangle at position (212, 44).
; PLAN: r0=212(x), r1=44(y), r2=102(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 44
LDI r2, 102
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
