; DESCRIPTION: Renders a white box of size 115x39 starting at (80, 215).
; PLAN: r0=80(x), r1=215(y), r2=115(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 215
LDI r2, 115
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
