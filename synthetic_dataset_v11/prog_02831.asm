; DESCRIPTION: Places a white 106x20 rectangle at position (20, 12).
; PLAN: r0=20(x), r1=12(y), r2=106(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 12
LDI r2, 106
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
