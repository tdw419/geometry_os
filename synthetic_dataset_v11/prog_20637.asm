; DESCRIPTION: Renders a green box of size 32x42 starting at (95, 163).
; PLAN: r0=95(x), r1=163(y), r2=32(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 163
LDI r2, 32
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
