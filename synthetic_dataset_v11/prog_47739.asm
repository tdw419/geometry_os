; DESCRIPTION: Places a green 20x102 rectangle at position (92, 123).
; PLAN: r0=92(x), r1=123(y), r2=20(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 123
LDI r2, 20
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
