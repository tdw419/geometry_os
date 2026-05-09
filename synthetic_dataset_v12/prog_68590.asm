; DESCRIPTION: Renders a orange box of size 98x20 starting at (215, 144).
; PLAN: r0=215(x), r1=144(y), r2=98(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 144
LDI r2, 98
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
