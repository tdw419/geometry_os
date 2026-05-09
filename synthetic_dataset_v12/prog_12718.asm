; DESCRIPTION: Renders a cyan box of size 44x94 starting at (267, 161).
; PLAN: r0=267(x), r1=161(y), r2=44(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 161
LDI r2, 44
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
