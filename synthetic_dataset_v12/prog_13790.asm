; DESCRIPTION: Renders a green box of size 63x63 starting at (104, 42).
; PLAN: r0=104(x), r1=42(y), r2=63(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 42
LDI r2, 63
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
