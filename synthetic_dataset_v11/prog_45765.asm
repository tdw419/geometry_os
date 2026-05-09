; DESCRIPTION: Renders a yellow box of size 81x86 starting at (42, 124).
; PLAN: r0=42(x), r1=124(y), r2=81(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 124
LDI r2, 81
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
