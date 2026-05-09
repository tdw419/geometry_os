; DESCRIPTION: Renders a green box of size 113x65 starting at (142, 98).
; PLAN: r0=142(x), r1=98(y), r2=113(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 98
LDI r2, 113
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
