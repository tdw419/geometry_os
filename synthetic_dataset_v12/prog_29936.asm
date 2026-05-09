; DESCRIPTION: Renders a green box of size 57x86 starting at (128, 141).
; PLAN: r0=128(x), r1=141(y), r2=57(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 141
LDI r2, 57
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
