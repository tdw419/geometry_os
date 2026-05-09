; DESCRIPTION: Renders a green box of size 113x58 starting at (117, 168).
; PLAN: r0=117(x), r1=168(y), r2=113(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 168
LDI r2, 113
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
