; DESCRIPTION: Renders a yellow box of size 30x53 starting at (433, 63).
; PLAN: r0=433(x), r1=63(y), r2=30(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 63
LDI r2, 30
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
