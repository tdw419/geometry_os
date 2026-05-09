; DESCRIPTION: Renders a white box of size 101x86 starting at (353, 132).
; PLAN: r0=353(x), r1=132(y), r2=101(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 132
LDI r2, 101
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
