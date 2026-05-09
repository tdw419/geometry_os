; DESCRIPTION: Places a green 65x100 rectangle at position (25, 71).
; PLAN: r0=25(x), r1=71(y), r2=65(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 71
LDI r2, 65
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
