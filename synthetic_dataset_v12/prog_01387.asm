; DESCRIPTION: Renders a blue box of size 95x10 starting at (305, 80).
; PLAN: r0=305(x), r1=80(y), r2=95(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 80
LDI r2, 95
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
