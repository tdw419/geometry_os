; DESCRIPTION: Renders a black box of size 21x11 starting at (231, 108).
; PLAN: r0=231(x), r1=108(y), r2=21(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 108
LDI r2, 21
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
