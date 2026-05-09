; DESCRIPTION: Renders a cyan box of size 79x12 starting at (108, 112).
; PLAN: r0=108(x), r1=112(y), r2=79(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 112
LDI r2, 79
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
