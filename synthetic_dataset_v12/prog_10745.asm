; DESCRIPTION: Renders a green box of size 86x72 starting at (317, 45).
; PLAN: r0=317(x), r1=45(y), r2=86(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 45
LDI r2, 86
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
