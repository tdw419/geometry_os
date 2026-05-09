; DESCRIPTION: Renders a yellow box of size 54x63 starting at (20, 42).
; PLAN: r0=20(x), r1=42(y), r2=54(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 42
LDI r2, 54
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
