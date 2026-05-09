; DESCRIPTION: Renders a yellow box of size 71x73 starting at (365, 21).
; PLAN: r0=365(x), r1=21(y), r2=71(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 21
LDI r2, 71
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
