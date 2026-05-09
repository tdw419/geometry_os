; DESCRIPTION: Renders a green box of size 40x50 starting at (21, 182).
; PLAN: r0=21(x), r1=182(y), r2=40(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 182
LDI r2, 40
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
