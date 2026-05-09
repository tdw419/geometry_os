; DESCRIPTION: Renders a green box of size 93x107 starting at (305, 5).
; PLAN: r0=305(x), r1=5(y), r2=93(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 5
LDI r2, 93
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
