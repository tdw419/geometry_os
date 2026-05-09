; DESCRIPTION: Renders a green box of size 36x38 starting at (178, 50).
; PLAN: r0=178(x), r1=50(y), r2=36(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 50
LDI r2, 36
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
