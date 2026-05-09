; DESCRIPTION: Renders a cyan box of size 75x48 starting at (267, 105).
; PLAN: r0=267(x), r1=105(y), r2=75(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 105
LDI r2, 75
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
