; DESCRIPTION: Places a green 28x106 rectangle at position (18, 54).
; PLAN: r0=18(x), r1=54(y), r2=28(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 54
LDI r2, 28
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
