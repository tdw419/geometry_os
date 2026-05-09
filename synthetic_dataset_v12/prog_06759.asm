; DESCRIPTION: Renders a green box of size 86x113 starting at (279, 23).
; PLAN: r0=279(x), r1=23(y), r2=86(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 23
LDI r2, 86
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
