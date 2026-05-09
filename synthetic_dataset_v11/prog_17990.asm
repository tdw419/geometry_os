; DESCRIPTION: Renders a green box of size 95x72 starting at (64, 150).
; PLAN: r0=64(x), r1=150(y), r2=95(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 150
LDI r2, 95
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
