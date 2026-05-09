; DESCRIPTION: Places a green 12x109 rectangle at position (191, 77).
; PLAN: r0=191(x), r1=77(y), r2=12(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 77
LDI r2, 12
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
