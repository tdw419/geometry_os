; DESCRIPTION: Renders a cyan box of size 32x43 starting at (303, 109).
; PLAN: r0=303(x), r1=109(y), r2=32(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 109
LDI r2, 32
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
