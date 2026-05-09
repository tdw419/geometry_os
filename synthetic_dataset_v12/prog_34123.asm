; DESCRIPTION: Renders a yellow box of size 10x24 starting at (365, 142).
; PLAN: r0=365(x), r1=142(y), r2=10(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 142
LDI r2, 10
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
