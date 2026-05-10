; DESCRIPTION: Renders a green rectangular region spanning 93 by 64 at (301, 29).
; PLAN: r0=301(x), r1=29(y), r2=93(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 29
LDI r2, 93
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
