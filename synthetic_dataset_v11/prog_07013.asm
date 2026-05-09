; DESCRIPTION: Renders a green box of size 113x90 starting at (70, 3).
; PLAN: r0=70(x), r1=3(y), r2=113(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 3
LDI r2, 113
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
