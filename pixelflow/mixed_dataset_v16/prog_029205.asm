; DESCRIPTION: Places a white 75x99 rectangle at position (7, 109).
; PLAN: r0=7(x), r1=109(y), r2=75(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 109
LDI r2, 75
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
