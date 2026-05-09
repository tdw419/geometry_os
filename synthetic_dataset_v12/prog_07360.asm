; DESCRIPTION: Renders a cyan box of size 14x46 starting at (420, 42).
; PLAN: r0=420(x), r1=42(y), r2=14(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 42
LDI r2, 14
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
