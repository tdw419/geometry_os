; DESCRIPTION: Renders a cyan box of size 81x57 starting at (74, 63).
; PLAN: r0=74(x), r1=63(y), r2=81(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 63
LDI r2, 81
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
