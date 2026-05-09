; DESCRIPTION: Renders a yellow box of size 24x79 starting at (445, 109).
; PLAN: r0=445(x), r1=109(y), r2=24(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 109
LDI r2, 24
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
