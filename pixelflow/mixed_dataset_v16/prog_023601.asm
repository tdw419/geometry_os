; DESCRIPTION: Renders a yellow box of size 86x50 starting at (42, 121).
; PLAN: r0=42(x), r1=121(y), r2=86(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 121
LDI r2, 86
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
