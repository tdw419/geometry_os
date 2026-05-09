; DESCRIPTION: Places a cyan 84x36 rectangle at position (112, 148).
; PLAN: r0=112(x), r1=148(y), r2=84(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 148
LDI r2, 84
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
