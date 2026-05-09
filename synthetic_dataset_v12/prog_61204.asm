; DESCRIPTION: Renders a cyan box of size 43x83 starting at (454, 42).
; PLAN: r0=454(x), r1=42(y), r2=43(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 42
LDI r2, 43
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
