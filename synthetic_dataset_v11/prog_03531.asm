; DESCRIPTION: Renders a yellow box of size 61x109 starting at (168, 30).
; PLAN: r0=168(x), r1=30(y), r2=61(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 30
LDI r2, 61
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
