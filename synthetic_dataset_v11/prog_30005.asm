; DESCRIPTION: Renders a red box of size 37x67 starting at (80, 91).
; PLAN: r0=80(x), r1=91(y), r2=37(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 91
LDI r2, 37
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
