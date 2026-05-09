; DESCRIPTION: Renders a green box of size 39x34 starting at (133, 164).
; PLAN: r0=133(x), r1=164(y), r2=39(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 164
LDI r2, 39
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
