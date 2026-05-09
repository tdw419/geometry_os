; DESCRIPTION: Renders a cyan box of size 19x85 starting at (184, 168).
; PLAN: r0=184(x), r1=168(y), r2=19(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 168
LDI r2, 19
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
