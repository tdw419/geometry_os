; DESCRIPTION: Places a yellow 42x98 rectangle at position (34, 90).
; PLAN: r0=34(x), r1=90(y), r2=42(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 90
LDI r2, 42
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
