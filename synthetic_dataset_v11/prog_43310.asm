; DESCRIPTION: Renders a green box of size 113x120 starting at (56, 107).
; PLAN: r0=56(x), r1=107(y), r2=113(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 107
LDI r2, 113
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
