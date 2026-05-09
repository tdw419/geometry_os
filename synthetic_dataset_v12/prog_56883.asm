; DESCRIPTION: Renders a cyan box of size 84x103 starting at (36, 63).
; PLAN: r0=36(x), r1=63(y), r2=84(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 63
LDI r2, 84
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
