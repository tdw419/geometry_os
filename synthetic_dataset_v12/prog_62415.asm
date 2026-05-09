; DESCRIPTION: Renders a black box of size 120x65 starting at (32, 117).
; PLAN: r0=32(x), r1=117(y), r2=120(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 117
LDI r2, 120
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
