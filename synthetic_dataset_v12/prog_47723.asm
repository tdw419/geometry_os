; DESCRIPTION: Renders a cyan box of size 37x48 starting at (42, 11).
; PLAN: r0=42(x), r1=11(y), r2=37(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 11
LDI r2, 37
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
