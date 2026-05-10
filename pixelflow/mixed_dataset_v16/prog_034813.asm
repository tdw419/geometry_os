; DESCRIPTION: Renders a green box of size 84x120 starting at (380, 90).
; PLAN: r0=380(x), r1=90(y), r2=84(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 90
LDI r2, 84
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
