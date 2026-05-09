; DESCRIPTION: Renders a cyan box of size 33x93 starting at (163, 159).
; PLAN: r0=163(x), r1=159(y), r2=33(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 159
LDI r2, 33
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
