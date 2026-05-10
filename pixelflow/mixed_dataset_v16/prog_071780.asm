; DESCRIPTION: Renders a yellow box of size 95x64 starting at (51, 128).
; PLAN: r0=51(x), r1=128(y), r2=95(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 128
LDI r2, 95
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
