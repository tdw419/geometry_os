; DESCRIPTION: Renders a cyan box of size 39x12 starting at (443, 158).
; PLAN: r0=443(x), r1=158(y), r2=39(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 158
LDI r2, 39
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
