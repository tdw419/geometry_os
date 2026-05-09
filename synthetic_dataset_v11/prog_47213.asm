; DESCRIPTION: Places a yellow 63x103 rectangle at position (32, 91).
; PLAN: r0=32(x), r1=91(y), r2=63(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 91
LDI r2, 63
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
