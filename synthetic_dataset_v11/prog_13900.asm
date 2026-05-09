; DESCRIPTION: Renders a red box of size 61x63 starting at (156, 79).
; PLAN: r0=156(x), r1=79(y), r2=61(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 79
LDI r2, 61
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
