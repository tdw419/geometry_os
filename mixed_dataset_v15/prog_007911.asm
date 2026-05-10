; DESCRIPTION: Places a blue 113x17 rectangle at position (247, 229).
; PLAN: r0=247(x), r1=229(y), r2=113(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 229
LDI r2, 113
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
