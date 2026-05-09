; DESCRIPTION: Places a green 36x100 rectangle at position (0, 18).
; PLAN: r0=0(x), r1=18(y), r2=36(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 18
LDI r2, 36
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
