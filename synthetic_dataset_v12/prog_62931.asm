; DESCRIPTION: Renders a yellow box of size 103x83 starting at (355, 93).
; PLAN: r0=355(x), r1=93(y), r2=103(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 93
LDI r2, 103
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
