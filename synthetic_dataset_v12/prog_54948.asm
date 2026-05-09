; DESCRIPTION: Renders a green box of size 20x19 starting at (443, 42).
; PLAN: r0=443(x), r1=42(y), r2=20(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 42
LDI r2, 20
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
