; DESCRIPTION: Renders a green box of size 28x42 starting at (314, 142).
; PLAN: r0=314(x), r1=142(y), r2=28(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 142
LDI r2, 28
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
