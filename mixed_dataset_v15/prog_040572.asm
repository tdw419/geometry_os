; DESCRIPTION: Renders a green box of size 109x120 starting at (103, 67).
; PLAN: r0=103(x), r1=67(y), r2=109(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 67
LDI r2, 109
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
