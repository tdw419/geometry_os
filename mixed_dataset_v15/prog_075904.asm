; DESCRIPTION: Renders a red box of size 50x28 starting at (21, 91).
; PLAN: r0=21(x), r1=91(y), r2=50(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 91
LDI r2, 50
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
