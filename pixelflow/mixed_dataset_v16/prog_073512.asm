; DESCRIPTION: Places a green 63x100 rectangle at position (340, 14).
; PLAN: r0=340(x), r1=14(y), r2=63(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 14
LDI r2, 63
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
