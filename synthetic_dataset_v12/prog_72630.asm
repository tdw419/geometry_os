; DESCRIPTION: Places a green 75x113 rectangle at position (170, 92).
; PLAN: r0=170(x), r1=92(y), r2=75(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 92
LDI r2, 75
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
