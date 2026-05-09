; DESCRIPTION: Renders a cyan box of size 114x63 starting at (85, 53).
; PLAN: r0=85(x), r1=53(y), r2=114(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 53
LDI r2, 114
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
