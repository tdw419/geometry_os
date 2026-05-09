; DESCRIPTION: Renders a red box of size 12x16 starting at (231, 45).
; PLAN: r0=231(x), r1=45(y), r2=12(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 45
LDI r2, 12
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
