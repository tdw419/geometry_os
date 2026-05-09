; DESCRIPTION: Renders a red box of size 120x63 starting at (107, 6).
; PLAN: r0=107(x), r1=6(y), r2=120(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 6
LDI r2, 120
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
