; DESCRIPTION: Places a white 54x106 rectangle at position (63, 130).
; PLAN: r0=63(x), r1=130(y), r2=54(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 130
LDI r2, 54
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
