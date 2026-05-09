; DESCRIPTION: Renders a black box of size 99x64 starting at (72, 164).
; PLAN: r0=72(x), r1=164(y), r2=99(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 164
LDI r2, 99
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
