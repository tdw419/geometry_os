; DESCRIPTION: Renders a green box of size 56x83 starting at (317, 168).
; PLAN: r0=317(x), r1=168(y), r2=56(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 168
LDI r2, 56
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
