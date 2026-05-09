; DESCRIPTION: Renders a green box of size 79x64 starting at (100, 171).
; PLAN: r0=100(x), r1=171(y), r2=79(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 171
LDI r2, 79
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
