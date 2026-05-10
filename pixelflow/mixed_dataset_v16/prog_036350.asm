; DESCRIPTION: Places a blue 96x113 rectangle at position (370, 92).
; PLAN: r0=370(x), r1=92(y), r2=96(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 92
LDI r2, 96
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
