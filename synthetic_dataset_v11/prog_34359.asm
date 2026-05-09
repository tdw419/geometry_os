; DESCRIPTION: Renders a green box of size 113x72 starting at (21, 145).
; PLAN: r0=21(x), r1=145(y), r2=113(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 145
LDI r2, 113
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
