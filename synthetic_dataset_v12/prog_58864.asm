; DESCRIPTION: Places a white 54x63 rectangle at position (412, 97).
; PLAN: r0=412(x), r1=97(y), r2=54(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 97
LDI r2, 54
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
