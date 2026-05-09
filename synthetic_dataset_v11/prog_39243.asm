; DESCRIPTION: Places a blue 21x92 rectangle at position (18, 20).
; PLAN: r0=18(x), r1=20(y), r2=21(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 20
LDI r2, 21
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
