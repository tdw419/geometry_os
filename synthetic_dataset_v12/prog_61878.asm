; DESCRIPTION: Renders a yellow box of size 42x117 starting at (263, 103).
; PLAN: r0=263(x), r1=103(y), r2=42(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 103
LDI r2, 42
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
