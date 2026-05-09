; DESCRIPTION: Renders a yellow box of size 55x27 starting at (154, 168).
; PLAN: r0=154(x), r1=168(y), r2=55(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 168
LDI r2, 55
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
