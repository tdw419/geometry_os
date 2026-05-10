; DESCRIPTION: Renders a yellow box of size 27x45 starting at (356, 172).
; PLAN: r0=356(x), r1=172(y), r2=27(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 172
LDI r2, 27
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
