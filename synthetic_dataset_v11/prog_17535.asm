; DESCRIPTION: Renders a black box of size 82x98 starting at (154, 30).
; PLAN: r0=154(x), r1=30(y), r2=82(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 30
LDI r2, 82
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
