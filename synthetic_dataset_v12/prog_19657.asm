; DESCRIPTION: Renders a red box of size 75x107 starting at (231, 128).
; PLAN: r0=231(x), r1=128(y), r2=75(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 128
LDI r2, 75
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
