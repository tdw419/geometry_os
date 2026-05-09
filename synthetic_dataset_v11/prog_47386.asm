; DESCRIPTION: Places a blue 36x100 rectangle at position (123, 138).
; PLAN: r0=123(x), r1=138(y), r2=36(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 138
LDI r2, 36
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
