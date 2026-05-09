; DESCRIPTION: Renders a yellow box of size 52x72 starting at (113, 146).
; PLAN: r0=113(x), r1=146(y), r2=52(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 146
LDI r2, 52
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
