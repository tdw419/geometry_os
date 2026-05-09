; DESCRIPTION: Places a white 20x110 rectangle at position (187, 124).
; PLAN: r0=187(x), r1=124(y), r2=20(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 124
LDI r2, 20
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
