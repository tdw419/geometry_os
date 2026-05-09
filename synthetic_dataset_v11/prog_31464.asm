; DESCRIPTION: Renders a cyan box of size 102x12 starting at (87, 71).
; PLAN: r0=87(x), r1=71(y), r2=102(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 71
LDI r2, 102
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
