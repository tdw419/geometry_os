; DESCRIPTION: Places a white 85x68 rectangle at position (91, 77).
; PLAN: r0=91(x), r1=77(y), r2=85(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 77
LDI r2, 85
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
