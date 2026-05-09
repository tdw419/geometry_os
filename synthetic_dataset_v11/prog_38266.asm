; DESCRIPTION: Renders a cyan box of size 63x28 starting at (26, 198).
; PLAN: r0=26(x), r1=198(y), r2=63(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 198
LDI r2, 63
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
