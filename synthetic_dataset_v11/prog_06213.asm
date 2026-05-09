; DESCRIPTION: Places a blue 92x113 rectangle at position (17, 132).
; PLAN: r0=17(x), r1=132(y), r2=92(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 132
LDI r2, 92
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
