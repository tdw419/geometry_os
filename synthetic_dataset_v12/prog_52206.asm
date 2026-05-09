; DESCRIPTION: Renders a cyan box of size 11x36 starting at (42, 164).
; PLAN: r0=42(x), r1=164(y), r2=11(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 164
LDI r2, 11
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
