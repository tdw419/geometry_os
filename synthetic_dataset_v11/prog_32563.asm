; DESCRIPTION: Renders a cyan box of size 109x15 starting at (147, 42).
; PLAN: r0=147(x), r1=42(y), r2=109(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 42
LDI r2, 109
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
