; DESCRIPTION: Places a white 20x35 rectangle at position (280, 79).
; PLAN: r0=280(x), r1=79(y), r2=20(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 79
LDI r2, 20
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
