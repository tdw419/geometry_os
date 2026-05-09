; DESCRIPTION: Renders a yellow box of size 15x64 starting at (198, 156).
; PLAN: r0=198(x), r1=156(y), r2=15(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 156
LDI r2, 15
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
