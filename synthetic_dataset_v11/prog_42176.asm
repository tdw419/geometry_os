; DESCRIPTION: Renders a green box of size 57x41 starting at (128, 169).
; PLAN: r0=128(x), r1=169(y), r2=57(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 169
LDI r2, 57
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
