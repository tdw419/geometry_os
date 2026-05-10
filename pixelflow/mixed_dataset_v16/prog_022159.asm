; DESCRIPTION: Renders a red box of size 63x103 starting at (101, 146).
; PLAN: r0=101(x), r1=146(y), r2=63(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 146
LDI r2, 63
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
