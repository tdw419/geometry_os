; DESCRIPTION: Renders a yellow box of size 27x90 starting at (367, 64).
; PLAN: r0=367(x), r1=64(y), r2=27(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 64
LDI r2, 27
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
