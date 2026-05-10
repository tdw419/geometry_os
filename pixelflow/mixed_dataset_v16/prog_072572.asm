; DESCRIPTION: Renders a cyan box of size 87x113 starting at (14, 63).
; PLAN: r0=14(x), r1=63(y), r2=87(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 63
LDI r2, 87
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
