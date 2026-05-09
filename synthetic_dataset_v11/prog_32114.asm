; DESCRIPTION: Renders a yellow box of size 76x36 starting at (50, 42).
; PLAN: r0=50(x), r1=42(y), r2=76(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 42
LDI r2, 76
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
