; DESCRIPTION: Renders a purple box of size 95x27 starting at (61, 12).
; PLAN: r0=61(x), r1=12(y), r2=95(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 12
LDI r2, 95
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
