; DESCRIPTION: Renders a cyan box of size 106x19 starting at (267, 26).
; PLAN: r0=267(x), r1=26(y), r2=106(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 26
LDI r2, 106
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
