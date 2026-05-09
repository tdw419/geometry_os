; DESCRIPTION: Renders a green box of size 58x68 starting at (103, 82).
; PLAN: r0=103(x), r1=82(y), r2=58(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 82
LDI r2, 58
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
