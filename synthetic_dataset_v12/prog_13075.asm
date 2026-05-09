; DESCRIPTION: Places a red 22x54 rectangle at position (431, 83).
; PLAN: r0=431(x), r1=83(y), r2=22(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 83
LDI r2, 22
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
