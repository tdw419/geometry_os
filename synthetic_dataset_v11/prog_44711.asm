; DESCRIPTION: Places a green 23x63 rectangle at position (19, 71).
; PLAN: r0=19(x), r1=71(y), r2=23(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 71
LDI r2, 23
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
