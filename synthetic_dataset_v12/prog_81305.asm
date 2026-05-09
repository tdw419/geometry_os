; DESCRIPTION: Renders a green box of size 93x33 starting at (9, 146).
; PLAN: r0=9(x), r1=146(y), r2=93(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 146
LDI r2, 93
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
