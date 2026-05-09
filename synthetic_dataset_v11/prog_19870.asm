; DESCRIPTION: Places a white 16x52 rectangle at position (20, 163).
; PLAN: r0=20(x), r1=163(y), r2=16(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 163
LDI r2, 16
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
