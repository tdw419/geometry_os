; DESCRIPTION: Renders a cyan box of size 12x42 starting at (376, 28).
; PLAN: r0=376(x), r1=28(y), r2=12(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 28
LDI r2, 12
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
