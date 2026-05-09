; DESCRIPTION: Renders a yellow box of size 42x16 starting at (9, 134).
; PLAN: r0=9(x), r1=134(y), r2=42(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 134
LDI r2, 42
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
