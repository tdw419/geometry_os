; DESCRIPTION: Places a yellow 65x63 rectangle at position (165, 16).
; PLAN: r0=165(x), r1=16(y), r2=65(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 16
LDI r2, 65
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
