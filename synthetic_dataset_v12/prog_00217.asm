; DESCRIPTION: Renders a yellow box of size 10x79 starting at (65, 164).
; PLAN: r0=65(x), r1=164(y), r2=10(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 164
LDI r2, 10
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
