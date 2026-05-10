; DESCRIPTION: Places a white 31x87 rectangle at position (65, 7).
; PLAN: r0=65(x), r1=7(y), r2=31(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 7
LDI r2, 31
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
