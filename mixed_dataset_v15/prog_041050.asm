; DESCRIPTION: Renders a black box of size 93x32 starting at (243, 128).
; PLAN: r0=243(x), r1=128(y), r2=93(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 128
LDI r2, 93
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
