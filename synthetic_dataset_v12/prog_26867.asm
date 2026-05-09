; DESCRIPTION: Renders a green box of size 14x61 starting at (392, 69).
; PLAN: r0=392(x), r1=69(y), r2=14(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 69
LDI r2, 14
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
