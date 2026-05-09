; DESCRIPTION: Renders a red box of size 37x16 starting at (66, 134).
; PLAN: r0=66(x), r1=134(y), r2=37(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 134
LDI r2, 37
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
