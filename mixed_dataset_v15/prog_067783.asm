; DESCRIPTION: Places a black 75x63 rectangle at position (215, 71).
; PLAN: r0=215(x), r1=71(y), r2=75(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 71
LDI r2, 75
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
