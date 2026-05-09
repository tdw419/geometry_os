; DESCRIPTION: Renders a cyan box of size 15x25 starting at (267, 133).
; PLAN: r0=267(x), r1=133(y), r2=15(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 133
LDI r2, 15
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
