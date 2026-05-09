; DESCRIPTION: Renders a cyan box of size 93x66 starting at (156, 175).
; PLAN: r0=156(x), r1=175(y), r2=93(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 175
LDI r2, 93
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
