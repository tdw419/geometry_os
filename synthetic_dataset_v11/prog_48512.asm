; DESCRIPTION: Renders a green box of size 68x34 starting at (42, 152).
; PLAN: r0=42(x), r1=152(y), r2=68(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 152
LDI r2, 68
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
