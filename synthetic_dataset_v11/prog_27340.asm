; DESCRIPTION: Places a green 77x66 rectangle at position (46, 37).
; PLAN: r0=46(x), r1=37(y), r2=77(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 37
LDI r2, 77
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
