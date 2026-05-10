; DESCRIPTION: Renders a cyan box of size 63x42 starting at (182, 181).
; PLAN: r0=182(x), r1=181(y), r2=63(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 181
LDI r2, 63
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
