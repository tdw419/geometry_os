; DESCRIPTION: Renders a yellow box of size 70x79 starting at (327, 175).
; PLAN: r0=327(x), r1=175(y), r2=70(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 175
LDI r2, 70
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
