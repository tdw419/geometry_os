; DESCRIPTION: Renders a yellow box of size 65x53 starting at (231, 42).
; PLAN: r0=231(x), r1=42(y), r2=65(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 42
LDI r2, 65
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
