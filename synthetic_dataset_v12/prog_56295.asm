; DESCRIPTION: Renders a cyan box of size 75x84 starting at (223, 71).
; PLAN: r0=223(x), r1=71(y), r2=75(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 71
LDI r2, 75
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
