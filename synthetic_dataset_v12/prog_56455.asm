; DESCRIPTION: Renders a green box of size 72x38 starting at (430, 79).
; PLAN: r0=430(x), r1=79(y), r2=72(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 79
LDI r2, 72
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
