; DESCRIPTION: Places a green 106x36 rectangle at position (256, 120).
; PLAN: r0=256(x), r1=120(y), r2=106(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 120
LDI r2, 106
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
