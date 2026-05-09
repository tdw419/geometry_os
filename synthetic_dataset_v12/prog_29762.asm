; DESCRIPTION: Places a green 65x103 rectangle at position (136, 16).
; PLAN: r0=136(x), r1=16(y), r2=65(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 16
LDI r2, 65
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
