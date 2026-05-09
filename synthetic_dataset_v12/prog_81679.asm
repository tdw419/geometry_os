; DESCRIPTION: Renders a black box of size 112x42 starting at (244, 206).
; PLAN: r0=244(x), r1=206(y), r2=112(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 206
LDI r2, 112
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
