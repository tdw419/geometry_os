; DESCRIPTION: Renders a green box of size 86x98 starting at (299, 153).
; PLAN: r0=299(x), r1=153(y), r2=86(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 153
LDI r2, 86
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
